//
//  CDSTextFieldStyleBuilder.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 30/08/24.
//

import Combine
import SwiftUI

class CDSTextFieldStyleBuilder: ObservableObject {
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
    
    var textFieldFont: Font { CDSText.textFieldFont.font }
    
    var textFieldRadius: CGFloat { CDSSize.textFieldCornerRadius.size }
    
    var image: String { secureRevealed ? "eye" : "eye.slash.fill" }
    
    var titleForeground: Color { CDSColor.darkGray.color }
    
    var textForeground: Color { CDSColor.black.color }
    
    var lineWidth: CGFloat { CDSSize.textFieldLineWidth.size }
    
    var height: CGFloat { CDSSize.textFieldHeight.size }
    
    var spacing: CGFloat { CDSSize.textFieldSpacing.size }
    
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
        case .error: CDSColor.error.color
        case .default: borderDefaultColor(for: isFocused)
        }
    }
    
    // MARK: - Private View Functions
    
    private func borderDefaultColor(for isFocused: Bool) -> Color {
        isFocused ? CDSColor.primary.color : CDSColor.darkGray.color
    }
    
    // MARK: - View Builders
    
    @ViewBuilder
    var eyeButton: some View {
        if isSecureField {
            Button (action: {
                self.secureRevealed.toggle()
            }, label: {
                Image(systemName: image)
                    .foregroundColor(CDSColor.darkGray.color)
            })
            .frame(maxWidth: CDSSize.textFieldIconSize.size,
                   maxHeight: CDSSize.textFieldIconSize.size)
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
