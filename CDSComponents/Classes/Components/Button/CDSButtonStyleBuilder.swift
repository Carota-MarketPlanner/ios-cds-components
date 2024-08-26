//
//  CDSButtonStyleBuilder.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 24/08/24.
//

import SwiftUI

class CDSButtonStyleBuilder {
    // MARK: - Typealiases

    typealias ButtonType = CDSButtonStyle.CDSButtonType
    typealias IconPosition = ButtonType.CDSButtonIconPosition
    typealias ButtonSize = CDSButtonStyle.CDSButtonSize
    
    // MARK: - Public Properties
    
    let horizontalPadding: CGFloat = 24
    let verticalPadding: CGFloat  = 20
    let height: CGFloat  = 58
    let cornerRadius: CGFloat  = 16
    let lineWidht: CGFloat = 2
    let spacing: CGFloat = 20
    
    // MARK: - Private Properties
    
    private var secondaryBackground: Color = .clear
    private var primaryForeground: Color = .white
    private let style: CDSButtonStyle
    
    // MARK: - Initializer
    
    init(style: CDSButtonStyle) {
        self.style = style
    }
    
    // MARK: - Public View Properties
    
    public var sizeValue: CGFloat? {
        switch size {
        case .infinity:
            return .infinity
        case .normal:
            return nil
        }
    }
    
    public var textSize: CGFloat? {
        return iconPosition != nil ? sizeValue : nil
    }
    
    public var disabled: Bool {
        switch style {
        case .primary(_, _, let disabled), .secondary(_, _, let disabled):
            return disabled
        }
    }
    
    var background: Color {
        switch style {
        case .primary: primaryBackground
        case .secondary: secondaryBackground
        }
    }
    
    var foregroundColor: Color {
        switch style {
        case .primary: primaryForeground
        case .secondary: secondaryForeground
        }
    }
    
    // MARK: - Private View Properties
    
    private var type: ButtonType {
        switch style {
        case .primary(let type, _, _), .secondary(let type, _, _):
            return type
        }
    }
    
    private var size: ButtonSize {
        switch style {
        case .primary(_, let size, _), .secondary(_, let size, _):
            return size
        }
    }
    
    private var iconPosition: IconPosition? {
        switch type {
        case .iconed(let position):
            return position
        case .default:
            return nil
        }
    }
    
    private var primaryBackground: Color {
        disabled ? Color(uiColor: .lightGray) : .green
    }
    
    private var secondaryForeground: Color {
        disabled ? Color(uiColor: .lightGray) : .green
    }
    
    // MARK: - View Builders
    
    @ViewBuilder
    func getOverlay() -> some View {
        switch style {
        case .secondary:
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(foregroundColor, lineWidth: lineWidht)
        default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func iconView(name: String) -> some View {
        Image(systemName: name)
    }
    
    @ViewBuilder
    private func viewWithIcon(position: IconPosition, @ViewBuilder content: () -> some View) -> some View {
        switch position {
        case .left(let name):
            iconView(name: name)
            content()
        case .right(let name):
            content()
            iconView(name: name)
        }
    }
    
    @ViewBuilder
    public func getViewContent(@ViewBuilder content: () -> some View) -> some View {
        if let iconPosition {
            viewWithIcon(position: iconPosition, content: content)
        } else {
            content()
        }
    }
}
