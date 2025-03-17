//
//  IconButtonStack.swift
//  CDSComponents_Example
//
//  Created by Elias Ferreira on 28/08/24.
//

import SwiftUI
import CDSComponents

struct IconButtonStack: View {
    typealias ButtonSize = CDSIconButtonStyle.CDSIconButtonType.CDSIconButtonSize
    var state: Bool
    var size: ButtonSize
    
    var iconButonIcon: String {
        buttonState == .enabled ? Constants.ButtonStack.lightSwitchOff : Constants.ButtonStack.lightSwitchOn
    }
    
    @Binding var buttonState: CDSButtonStyle.CDSButtonState
    
    init(state: Bool, buttonState: Binding<CDSButtonStyle.CDSButtonState>, size: ButtonSize) {
        self.state = state
        _buttonState = buttonState
        self.size = size
    }
    
    var body: some View {
        HStack {
            CDSIconButton(icon: iconButonIcon,
                          style: .primary(type: .default(size: size, disabled: state))) {
                toggleButtonState()
            }
            
            CDSIconButton(icon: iconButonIcon,
                          style: .secondary(type: .default(size: size, disabled: state))) {
                toggleButtonState()
            }
            
            CDSIconButton(icon: iconButonIcon,
                          style: .primary(type: .stroked(size: size, disabled: state))) {
                toggleButtonState()
            }
            
            CDSIconButton(icon: iconButonIcon,
                          style: .secondary(type: .stroked(size: size, disabled: state))) {
                toggleButtonState()
            }
        }
    }
    
    private func toggleButtonState() {
        buttonState = buttonState == .enabled ? .loading : .enabled
    }
}
