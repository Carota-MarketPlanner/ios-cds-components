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
    
    var text: String {
        buttonDisabled ? "Habilitar" : "Desabilitar"
    }
    
    var icon: String {
        buttonDisabled ? "lightswitch.off" : "lightswitch.on.fill"
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            CDSButton("Button",
                      style: .primary(type: .iconed(position: .right(name: "plus")),
                                      size: .infinity,
                                      disabled: buttonDisabled)) {
                
                print("Deu certo")
            }
            
            CDSButton("Button",
                      style: .secondary(type: .default,
                                        size: .infinity,
                                        disabled: buttonDisabled)) {
                print("Deu certo")
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                CDSIconButton(icon: icon) {
                    buttonDisabled.toggle()
                }
                
                CDSIconButton(icon: icon) {
                    buttonDisabled.toggle()
                }
            }
            
        }
        .padding(theme.sizes.margin)
        .background(theme.colors.white.color)
    }
}

#Preview {
    ContentView()
}
