//
//  CDSTextField.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 28/08/24.
//

import SwiftUI

public struct CDSTextField: View {
    @FocusState var isFocused: Bool
    @Binding var text: String
    @ObservedObject var styleBuilder: CDSTextFieldStyleBuilder
    
    var title: String
    
    var isFloating: Bool {
        isFocused || !text.isEmpty
    }
    
    public init(
        _ title: String,
        text: Binding<String>,
        type: CDSTextFieldType = .text,
        state: CDSTextFieldState = .default
    ) {
        _text = text
        self.title = title
        self.styleBuilder = CDSTextFieldStyleBuilder(type: type, state: state)
    }
    
    public var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: styleBuilder.textFieldRadius)
                .strokeBorder(
                    styleBuilder.borderColor(for: isFocused),
                    lineWidth: styleBuilder.lineWidth
                )
                .frame(height: styleBuilder.height)
                .mask(
                    ZStack(alignment: .leading) {
                        Rectangle()
                        floatingPlaceholder(background: .black)
                            .blendMode(.destinationOut)
                    }
                )
                .compositingGroup()
            
            HStack {
                Group {
                    styleBuilder.textField(_text, state: $isFocused)
                }
                .font(styleBuilder.textFieldFont)
                .foregroundColor(styleBuilder.textForeground)
                
                if !text.isEmpty { styleBuilder.eyeButton }
            }
            .padding(.horizontal, styleBuilder.textFieldRadius)
            
            floatingPlaceholder()
        }
        .contentShape(Rectangle())
        .padding(.top, styleBuilder.spacing)
        .onTapGesture {
            isFocused = true
        }
    }
    
    @ViewBuilder
    private func floatingPlaceholder(background: Color = .clear) -> some View {
        CDSFloatingText(
            title: title,
            selected: isFloating,
            background: background
        )
        .font(styleBuilder.textFieldFont)
        .foregroundColor(styleBuilder.titleForeground)
        .allowsHitTesting(false)
    }
}
