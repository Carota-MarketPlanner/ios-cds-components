//
//  CDSIconButton.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 27/08/24.
//

import SwiftUI

public struct CDSIconButton: View {
    private let icon: String
    private let styleBuilder: CDSIconButtonStyleBuilder
    private let action: () -> Void
    
    public init(
        icon: String,
        style: CDSIconButtonStyle,
        disabled: Bool = false,
        action: @escaping () -> Void
    ) {
        self.icon = icon
        self.styleBuilder = CDSIconButtonStyleBuilder(style: style)
        self.action = action
    }
    
    
    public var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 18)
                    .frame(maxHeight: 18)
            }
            .padding(20)
            .frame(width: 58, height: 58)
            .background(styleBuilder.background)
            .foregroundColor(styleBuilder.foregroundColor)
            .cornerRadius(styleBuilder.cornerRadius)
            .overlay { styleBuilder.getOverlay() }
        }
        .disabled(styleBuilder.disabled)
        
    }
}
