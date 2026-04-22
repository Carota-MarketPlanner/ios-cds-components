//
//  CDSIconButtonStyleBuilder.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 28/08/24.
//

import SwiftUI

class CDSIconButtonStyleBuilder {
    // MARK: - Typealiases
    
    typealias ButtonType = CDSIconButtonStyle.CDSIconButtonType
    typealias ButtonSize = ButtonType.CDSIconButtonSize
    
    // MARK: - Private Properties
    
    private let style: CDSIconButtonStyle
    
    // MARK: - Initializer
    
    init(style: CDSIconButtonStyle) {
        self.style = style
    }
    
    // MARK: - Public View Properties
    
    var buttonSize: CGFloat {
        size == .normal ? CDSSize.buttonSize.size : CDSSize.buttonSmallSize.size
    }
    
    var buttonIconSize: CGFloat {
        size == .normal ? CDSSize.buttonIconSize.size : CDSSize.buttonIconSmallSize.size
    }
    
    var buttonPadding: CGFloat {
        size == .normal ? CDSSize.buttonPadding.size : CDSSize.buttonSmallPadding.size
    }
    
    var lineWidht: CGFloat {
        size == .normal ? CDSSize.buttonLineWidht.size : CDSSize.buttonSmallLineWidht.size
    }
    
    var cornerRadius: CGFloat {
        size == .normal ? CDSSize.buttonCornerRadius.size : CDSSize.buttonSmallCornerRadius.size
    }
    
    var background: Color {
        switch style {
        case .primary(let type):
            return primaryBackground(for: type)
        case .secondary(let type):
            return secondaryBackground(for: type)
        }
    }
    
    var foregroundColor: Color {
        switch style {
        case .primary(let type):
            return primaryForeground(for: type)
        case .secondary(let type):
            return secondaryForeground(for: type)
        }
    }
    
    var disabled: Bool {
        switch type {
        case .default(_, let disabled), .stroked(_, let disabled):
            return disabled
        }
    }
    
    // MARK: - Private View Properties
    
    private var type: ButtonType {
        switch style {
        case .primary(let type), .secondary(let type):
            return type
        }
    }
    
    private var size: ButtonSize {
        switch type {
        case .default(let size, _), .stroked(let size, _):
            return size
        }
    }
    
    // MARK: - Private View Functions
    
    // Background
    
    private func primaryBackground(for type: ButtonType) -> Color {
        switch type {
        case .default(_, let disabled):
            primaryBackground(for: disabled)
        case .stroked: .clear
        }
    }
    
    private func secondaryBackground(for type: ButtonType) -> Color {
        switch type {
        case .default: CDSColor.lightGray.color
        case .stroked: .clear
        }
    }
    
    private func primaryBackground(for disabled: Bool) -> Color {
        disabled ? CDSColor.lightGray.color : CDSColor.primary.color
    }
    
    // Foreground
    
    private func primaryForeground(for type: ButtonType) -> Color {
        switch type {
        case .stroked(_, let disabled):
            strokedPrimaryForeground(for: disabled)
        case .default(_, let disabled):
            primaryForeground(for: disabled)
        }
    }
    
    private func secondaryForeground(for type: ButtonType) -> Color {
        switch type {
        case .default(_, let disabled), .stroked(_, let disabled):
            secondaryForeground(for: disabled)
        }
    }
    
    private func strokedPrimaryForeground(for disabled: Bool) -> Color {
        disabled ? CDSColor.gray.color : CDSColor.primary.color
    }
    
    private func primaryForeground(for disabled: Bool) -> Color {
        disabled ? CDSColor.gray.color : CDSColor.white.color
    }
    
    private func secondaryForeground(for disabled: Bool) -> Color {
        disabled ? CDSColor.gray.color : CDSColor.darkGray.color
    }
    
    // MARK: - View Builders
    
    @ViewBuilder
    func getOverlay() -> some View {
        switch type {
        case .stroked:
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(CDSColor.lightGray.color , lineWidth: lineWidht)
        default:
            EmptyView()
        }
    }
}
