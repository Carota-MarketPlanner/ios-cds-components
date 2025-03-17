//
//  CDSButtonStyleBuilder.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 24/08/24.
//

import SwiftUI

class CDSButtonStyleBuilder {
    
    @CDSThemeCore var theme: CDSTheme
    
    // MARK: - Typealiases

    typealias ButtonType = CDSButtonStyle.CDSButtonType
    typealias IconPosition = ButtonType.CDSButtonIconPosition
    typealias ButtonSize = CDSButtonStyle.CDSButtonSize
    typealias ButtonState = CDSButtonStyle.CDSButtonState
    
    // MARK: - Public Properties
    
    var padding: CGFloat { theme.sizes.buttonPadding }
    var height: CGFloat  { theme.sizes.buttonSize }
    var cornerRadius: CGFloat { theme.sizes.buttonCornerRadius }
    var lineWidht: CGFloat { theme.sizes.buttonLineWidht }
    var spacing: CGFloat { theme.sizes.buttonSpacing }
    var font: Font { theme.fonts.buttonFont.font }
    
    // MARK: - Private Properties
    
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
    
    public var state: ButtonState {
        switch style {
        case .primary(_, _, let state), .secondary(_, _, let state):
            return state
        }
    }
    
    public var isEnabled: Bool {
        state == .enabled
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
    
    private var loadingStyle: CDSLoadingCircleStyle {
        switch style {
        case .primary(_, _, _):
            return .onBrand(size: .small)
        case .secondary(_, _, _):
            return .default(size: .small)
        }
    }
    
    private var primaryBackground: Color {
        state == .disabled ? theme.colors.lightGray.color : theme.colors.primary.color
    }
    
    private var secondaryForeground: Color {
        state == .disabled  ? theme.colors.gray.color : theme.colors.primary.color
    }
    
    private var primaryForeground: Color {
        state == .disabled  ? theme.colors.gray.color : theme.colors.white.color
    }
    
    private var secondaryBackground: Color = .clear
    
    // MARK: - View Builders
    
    @ViewBuilder
    func getOverlay() -> some View {
        switch style {
        case .secondary:
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(primaryBackground, lineWidth: lineWidht)
        default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func iconView(name: String) -> some View {
        Image(systemName: name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxHeight: theme.sizes.buttonIconSize)
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
    private func getViewWithContent(@ViewBuilder content: () -> some View) -> some View {
        if let iconPosition {
            viewWithIcon(position: iconPosition, content: content)
        } else {
            content()
        }
    }
    
    @ViewBuilder
    public func getViewContent(@ViewBuilder content: () -> some View) -> some View {
        switch state {
        case .loading:
            CDSLoadingCircle(style: loadingStyle)
        default:
            getViewWithContent(content: content)
        }
    }
}
