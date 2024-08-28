//
//  CDSIconButtonStyleBuilder.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 28/08/24.
//

import SwiftUI

class CDSIconButtonStyleBuilder {
    
    @CDSThemeCore var theme: CDSTheme
    
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
        size == .normal ? theme.sizes.buttonSize : theme.sizes.buttonSmallSize
    }
    
    var buttonIconSize: CGFloat {
        size == .normal ? theme.sizes.buttonIconSize : theme.sizes.buttonIconSmallSize
    }
    
    var buttonPadding: CGFloat {
        size == .normal ? theme.sizes.iconButtonPadding : theme.sizes.iconButtonSmallPadding
    }
    
    var lineWidht: CGFloat {
        size == .normal ? theme.sizes.buttonLineWidht : theme.sizes.buttonSmallLineWidht
    }
    
    var cornerRadius: CGFloat {
        size == .normal ? theme.sizes.buttonCornerRadius : theme.sizes.buttonSmallCornerRadius
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
        case .default: theme.colors.lightGray.color
        case .stroked: .clear
        }
    }
    
    private func primaryBackground(for disabled: Bool) -> Color {
        disabled ? theme.colors.lightGray.color : theme.colors.green.color
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
        disabled ? theme.colors.gray.color : theme.colors.green.color
    }
    
    private func primaryForeground(for disabled: Bool) -> Color {
        disabled ? theme.colors.gray.color : theme.colors.white.color
    }
    
    private func secondaryForeground(for disabled: Bool) -> Color {
        disabled ? theme.colors.gray.color : theme.colors.darkGray.color
    }
    
    // MARK: - View Builders
    
    @ViewBuilder
    func getOverlay() -> some View {
        switch type {
        case .stroked:
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(theme.colors.lightGray.color, lineWidth: lineWidht)
        default:
            EmptyView()
        }
    }
}
