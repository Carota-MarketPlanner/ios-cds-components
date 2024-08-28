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
    
    @State var buttonDisabled: Bool = false
    @State var buttonIconDisabled: Bool = false
    
    var text: String {
        buttonIconDisabled ? "Habilitar" : "Desabilitar"
    }
    
    var buttonIcon: String {
        buttonIconDisabled ? "lightswitch.off" : "lightswitch.on.fill"
    }
    
    var iconButonIcon: String {
        buttonDisabled ? "lightswitch.off" : "lightswitch.on.fill"
    }
    
    var body: some View {
        VStack {
            Spacer()
            buttonStack
            Spacer()
            iconButtonStack
            iconButtonSmallStack
        }
        .padding(theme.sizes.margin)
        .background(theme.colors.white.color)
    }
    
    private var buttonStack: some View {
        VStack {
            CDSButton(text,
                      style: .primary(type: .iconed(position: .right(name: buttonIcon)),
                                      size: .infinity,
                                      disabled: buttonDisabled)) {
                buttonIconDisabled.toggle()
                print("Deu certo")
            }
            
            CDSButton(text,
                      style: .primary(type: .iconed(position: .left(name: buttonIcon)),
                                      size: .infinity,
                                      disabled: buttonDisabled)) {
                buttonIconDisabled.toggle()
                print("Deu certo")
            }
            
            CDSButton(text,
                      style: .secondary(type: .default,
                                        size: .infinity,
                                        disabled: buttonDisabled)) {
                buttonIconDisabled.toggle()
                print("Deu certo")
            }
        }
    }
    
    private var iconButtonStack: some View {
        HStack {
            Spacer()
            
            CDSIconButton(icon: iconButonIcon,
                          style: .primary(type: .default(disabled: buttonIconDisabled))) {
                buttonDisabled.toggle()
            }
            
            CDSIconButton(icon: iconButonIcon,
                          style: .secondary(type: .default(disabled: buttonIconDisabled))) {
                buttonDisabled.toggle()
            }
            
            CDSIconButton(icon: iconButonIcon,
                          style: .primary(type: .stroked(disabled: buttonIconDisabled))) {
                buttonDisabled.toggle()
            }
            
            CDSIconButton(icon: iconButonIcon,
                          style: .secondary(type: .stroked(disabled: buttonIconDisabled))) {
                buttonDisabled.toggle()
            }
        }
    }
    
    private var iconButtonSmallStack: some View {
        HStack {
            Spacer()
            
            CDSIconButton(icon: iconButonIcon,
                          style: .primary(type: .default(size: .small,
                                                         disabled: buttonIconDisabled))) {
                buttonDisabled.toggle()
            }
            
            CDSIconButton(icon: iconButonIcon,
                          style: .secondary(type: .default(size: .small,
                                                           disabled: buttonIconDisabled))) {
                buttonDisabled.toggle()
            }
            
            CDSIconButton(icon: iconButonIcon,
                          style: .primary(type: .stroked(size: .small,
                                                         disabled: buttonIconDisabled))) {
                buttonDisabled.toggle()
            }
            
            CDSIconButton(icon: iconButonIcon,
                          style: .secondary(type: .stroked(size: .small,
                                                           disabled: buttonIconDisabled))) {
                buttonDisabled.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
