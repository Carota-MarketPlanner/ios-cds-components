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
        VStack(alignment: .leading, spacing: styleBuilder.spacing) {
            CDSAnimatedTitle(
                title: title,
                selected: !isFocused && text.isEmpty
            )
            .font(styleBuilder.textFieldFont)
            .foregroundColor(styleBuilder.titleForeground)
            
            HStack {
                Group {
                    styleBuilder.textField(_text, state: $isFocused)
                }
                .font(styleBuilder.textFieldFont)
                .foregroundColor(styleBuilder.textForeground)
                
                if !text.isEmpty { styleBuilder.eyeButton }
            }
            .frame(height: styleBuilder.height)
            
            Rectangle()
                .frame(height: styleBuilder.lineWidth)
                .foregroundColor(styleBuilder.borderColor(for: isFocused))
        }
        .onTapGesture {
            isFocused = true
        }
    }
}
