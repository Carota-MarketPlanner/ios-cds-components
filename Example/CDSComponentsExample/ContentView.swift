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
        buttonDisabled ? "lightswitch.off" : "rectangle.portrait.and.arrow.right"
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            CDSButton("Button",
                      style: .primary(type: .iconed(position: .right(name: "plus.circle")),
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
            
            CDSButton(text,
                      style: .primary(type: .iconed(position: .left(name: icon)),
                                      size: .infinity)) {
                buttonDisabled.toggle()
            }
            
        }
        .padding(theme.size.margin)
        .background(theme.colors.white.color)
    }
}

#Preview {
    ContentView()
}
