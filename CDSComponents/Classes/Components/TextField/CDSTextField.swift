//
//  CDSTextField.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 28/08/24.
//

import SwiftUI

public struct CDSTextField: View {
    @CDSThemeCore var theme: CDSTheme
    
    @FocusState var isFocused: Bool
    @Binding var text: String
    
    var title: String
    
    public init(_ title: String, text: Binding<String>) {
        _text = text
        self.title = title
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 11) {
            TFAnimatedTitle(
                title: title,
                selected: !isFocused && text.isEmpty
            )
            .font(theme.fonts.textFieldFont.font)
            .foregroundColor(theme.colors.darkGray.color)
            
            TextField(String(), text: _text)
                .focused($isFocused)
                .font(theme.fonts.textFieldFont.font)
            
//            SecureField(String(), text: _text)
//                .focused($isFocused)
//                .font(theme.fonts.textFieldFont.font)
            
            Rectangle().frame(height: 1).foregroundColor(isFocused ? theme.colors.green.color : theme.colors.darkGray.color)
        }
    }
}
