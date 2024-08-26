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
    @State var buttonDisabled: Bool = false
    
    var body: some View {
        VStack {
            CDSButton(buttonText,
                      style: .primary(type: .iconed(position: .right(name: "plus.circle")),
                                      size: .infinity,
                                      disabled: buttonDisabled)) {
                print("Deu certo")
                buttonDisabled = true
            }
                                      
            
            CDSButton(buttonText,
                      style: .primary(type: .iconed(position: .left(name: "plus")),
                                      size: .infinity,
                                      disabled: false)) {
                buttonDisabled.toggle()
                print("Deu certo")
            }
            
            CDSButton(buttonText,
                      style: .secondary(type: .default,
                                        size: .infinity,
                                        disabled: true)) {
                print("Deu certo")
            }
            
        }
        .padding(24)
    }
}

#Preview {
    ContentView()
}
