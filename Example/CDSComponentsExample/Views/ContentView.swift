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
    @State var name: String = Constants.empty
    @State var email: String = Constants.empty
    @State var password: String = Constants.empty
    @State var cellphone: String = Constants.empty
    
    var text: String {
        buttonIconState ? Constants.turnOn : Constants.turnOff
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                CDSLabel(style: .primary(Constants.exampleTitle, type: .title))
                
                Spacer()
                
                CDSLabel(style: .secondary(Constants.button, type: .largeContent))
                
                ButtonStack(text: text,
                            state: buttonState,
                            iconButtonState: $buttonIconState)
                
                Spacer()
                
                CDSLabel(style: .secondary(Constants.textField, type: .largeContent))
                
                VStack(spacing: 33) {
                    CDSTextField(Constants.name, text: $name, type: .capitalized)
                    CDSTextField(Constants.email, text: $email, type: .email, state: .error)
                    CDSTextField(Constants.cellphone, text: $cellphone, type: .number)
                    CDSTextField(Constants.password, text: $password, type: .password)
                }
                
                
                Spacer()
                
                CDSLabel(style: .secondary(Constants.iconButton, type: .largeContent))
                
                IconButtonStack(state: buttonIconState,
                                buttonState: $buttonState,
                                size: .normal)
                
                IconButtonStack(state: buttonIconState,
                                buttonState: $buttonState,
                                size: .small)
                Spacer()
                
                CDSLabel(style: .secondary(Constants.actionLabel, type: .largeContent))
                
                CDSActionLabel(content: [
                    .link(text: Constants.apple, url: Constants.appleURL),
                    .text(text: Constants.siginupCallPhrase),
                    .button(text: Constants.sighUp, action: toggleButtons)
                ])
            }
            .padding(theme.sizes.margin)
            .background(theme.colors.white.color)
        }
    }
    
    private func toggleButtons() {
        buttonState.toggle()
        buttonIconState.toggle()
    }
        
}

#Preview {
    ContentView()
}
