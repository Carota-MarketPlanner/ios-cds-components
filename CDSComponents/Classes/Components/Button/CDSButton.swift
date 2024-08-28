//
//  CDSButton.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 28/07/24.
//

import SwiftUI

public struct CDSButton: View {
    private let label: String
    private let styleBuilder: CDSButtonStyleBuilder
    private let action: () -> Void
    
    public init(
        _ label: String,
        style: CDSButtonStyle,
        disabled: Bool = false,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.styleBuilder = CDSButtonStyleBuilder(style: style)
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            HStack(spacing: styleBuilder.spacing) {
                styleBuilder.getViewContent {
                    Text(label)
                        .frame(maxWidth: styleBuilder.textSize, alignment: .leading)
                        .font(styleBuilder.font)
                }
            }
            .padding(.horizontal, styleBuilder.padding)
            .frame(maxWidth: styleBuilder.sizeValue)
            .frame(height: styleBuilder.height)
            .background(styleBuilder.background)
            .foregroundColor(styleBuilder.foregroundColor)
            .cornerRadius(styleBuilder.cornerRadius)
            .overlay { styleBuilder.getOverlay() }
        }
        .disabled(styleBuilder.disabled)
    }
}
