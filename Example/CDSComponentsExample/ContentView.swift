//
//  ContentView.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 28/07/24.
//

import SwiftUI
import CDSComponents

struct ContentView: View {
    
    @State var buttonText: String = "Clique aqui"
    @State var buttonState: CDSButtonStyle.CDSButtonState = .enabled
    
    var body: some View {
        VStack {
            CDSButton(buttonText,
                      style: .primary(type: .iconed(position: .right(name: "plus.circle")),
                                      size: .infinity,
                                      state: buttonState)) {
                print("Deu certo")
                buttonState = .disabled
            }
                                      
            
            CDSButton(buttonText,
                      style: .primary(type: .iconed(position: .left(name: "plus")),
                                      size: .infinity,
                                      state: .enabled)) {
                print("Deu certo")
            }
            
            CDSButton(buttonText,
                      style: .secondary(type: .default,
                                        size: .infinity,
                                        state: .disabled)) {
                print("Deu certo")
            }
            
        }
        .padding(24)
    }
}

#Preview {
    ContentView()
}
