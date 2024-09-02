//
//  CDSTextFieldStyleBuilder.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 30/08/24.
//

import SwiftUI

class CDSTextFieldStyleBuilder: ObservableObject {
    @CDSThemeCore var theme: CDSTheme
    
    // MARK: - Typealiases
    
    // MARK: - Private Properties
    
    @Published var secureRevealed: Bool = false
    
    private let type: CDSTextFieldType
    private let state: CDSTextFieldState
    
    // MARK: - Initializer
    
    init(type: CDSTextFieldType, state: CDSTextFieldState) {
        self.type = type
        self.state = state
    }
    
    // MARK: - Public View Properties
    
    var textFieldFont: Font { theme.fonts.textFieldFont.font }
    
    var image: String { secureRevealed ? "eye" : "eye.slash.fill" }
    
    var titleForeground: Color { theme.colors.darkGray.color }
    
    var textForeground: Color { theme.colors.black.color }
    
    var lineWidth: CGFloat { theme.sizes.textFieldLineWidth }
    
    var height: CGFloat { theme.sizes.textFieldHeight }
    
    var spacing: CGFloat { theme.sizes.textFieldSpacing }
    
    // MARK: - Private View Properties
    
    private var isSecureField: Bool {
        switch type {
        case .password: true
        default: false
        }
    }
    
    private var autocapitalization: TextInputAutocapitalization {
        switch type {
        case .capitalized: .words
        case .text: .sentences
        default: .never
        }
    }
    
    private var autocorrectionDisabled: Bool {
        switch type {
        case .text, .capitalized: true
        default: false
        }
    }
    
    private var keyboardType: UIKeyboardType {
        switch type {
        case .text, .capitalized: .default
        case .password: .asciiCapable
        case .email: .emailAddress
        case .number: .decimalPad
        case .cpf: .numberPad
        case .cellphone: .phonePad
        }
    }
    
    // MARK: - Public View Functions
    
    func borderColor(for isFocused: Bool) -> Color {
        switch state {
        case .error: theme.colors.error.color
        case .default: borderDefaultColor(for: isFocused)
        }
    }
    
    // MARK: - Private View Functions
    
    private func borderDefaultColor(for isFocused: Bool) -> Color {
        isFocused ? theme.colors.primary.color : theme.colors.darkGray.color
    }
    
    // MARK: - View Builders
    
    @ViewBuilder
    var eyeButton: some View {
        if isSecureField {
            Button (action: {
                self.secureRevealed.toggle()
            }, label: {
                Image(systemName: image)
                    .foregroundColor(theme.colors.darkGray.color)
            })
            .frame(maxWidth: theme.sizes.textFieldIconSize,
                   maxHeight: theme.sizes.textFieldIconSize)
        }
    }
    
    @ViewBuilder
    func textField(_ text: Binding<String>, state: FocusState<Bool>.Binding) -> some View {
        if isSecureField && !secureRevealed {
            SecureField(String(), text: text)
                .focused(state)
                .autocorrectionDisabled(true)
        } else {
            TextField(String(), text: text)
                .focused(state)
                .textInputAutocapitalization(autocapitalization)
                .keyboardType(keyboardType)
                .autocorrectionDisabled(autocorrectionDisabled)
        }
    }
}
