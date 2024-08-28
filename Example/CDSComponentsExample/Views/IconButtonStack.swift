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
        buttonState ? "lightswitch.off" : "lightswitch.on.fill"
    }
    
    @Binding var buttonState: Bool
    
    init(state: Bool, buttonState: Binding<Bool>, size: ButtonSize) {
        self.state = state
        _buttonState = buttonState
        self.size = size
    }
    
    var body: some View {
        HStack {
            Spacer()
            
            CDSIconButton(icon: iconButonIcon,
                          style: .primary(type: .default(size: size, disabled: state))) {
                buttonState.toggle()
            }
            
            CDSIconButton(icon: iconButonIcon,
                          style: .secondary(type: .default(size: size, disabled: state))) {
                buttonState.toggle()
            }
            
            CDSIconButton(icon: iconButonIcon,
                          style: .primary(type: .stroked(size: size, disabled: state))) {
                buttonState.toggle()
            }
            
            CDSIconButton(icon: iconButonIcon,
                          style: .secondary(type: .stroked(size: size, disabled: state))) {
                buttonState.toggle()
            }
        }
    }
}
