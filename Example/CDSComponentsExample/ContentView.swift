//
//  ContentView.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 28/07/24.
//

import SwiftUI
import CDSComponents

struct ContentView: View {
    @CDSThemeCore var theme: CDSTheme
    
    @State var buttonState: Bool = false
    @State var buttonIconState: Bool = false
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var text: String {
        buttonIconState ? "Habilitar" : "Desabilitar"
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            ButtonStack(text: text,
                        state: buttonState,
                        iconButtonState: $buttonIconState)
            
            Spacer()
            
            VStack(spacing: 33) {
                CDSTextField("Name", text: $name, type: .capitalized)
                CDSTextField("Email", text: $email, type: .email, state: .error)
                CDSTextField("Celular", text: $password, type: .number)
                CDSTextField("Password", text: $password, type: .password)
            }
            
            Spacer()
            
            IconButtonStack(state: buttonIconState,
                            buttonState: $buttonState,
                            size: .normal)
            
            IconButtonStack(state: buttonIconState,
                            buttonState: $buttonState,
                            size: .small)
        }
        .padding(theme.sizes.margin)
        .background(theme.colors.white.color)
    }
        
}

#Preview {
    ContentView()
}
