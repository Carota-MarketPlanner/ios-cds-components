//
//  ButtonStack.swift
//  CDSComponents_Example
//
//  Created by Elias Ferreira on 28/08/24.
//

import SwiftUI
import CDSComponents

struct ButtonStack: View {
    var text: String
    var state: CDSButtonStyle.CDSButtonState
    
    @Binding var iconButtonState: Bool
    
    var buttonIcon: String {
        iconButtonState ? Constants.ButtonStack.lightSwitchOff : Constants.ButtonStack.lightSwitchOn
    }
    
    init(text: String, state: CDSButtonStyle.CDSButtonState, iconButtonState: Binding<Bool>) {
        self.text = text
        self.state = state
        _iconButtonState = iconButtonState
    }
    
    var body: some View {
        VStack {
            CDSButton(text,
                      style: .primary(type: .iconed(position: .right(name: buttonIcon)),
                                      size: .infinity,
                                      state: state)) {
                iconButtonState.toggle()
            }
            
            CDSButton(text,
                      style: .primary(type: .iconed(position: .left(name: buttonIcon)),
                                      size: .infinity,
                                      state: state)) {
                iconButtonState.toggle()
            }
            
            CDSButton(text,
                      style: .secondary(type: .default,
                                        size: .infinity,
                                        state: state)) {
                iconButtonState.toggle()
            }
        }
    }
}
