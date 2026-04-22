//
//  CDSComponentsApp.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 28/07/24.
//

import SwiftUI
import CDSComponents

@main
struct CDSComponentsApp: App {
    
    init() {
        CDSThemeConfig.shared.setTheme(theme: CarotaExampleTheme())
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
