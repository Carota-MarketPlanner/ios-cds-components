//
//  CDSComponentsApp.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 28/07/24.
//

import SwiftUI
import CarotaTheme
import CDSComponents

@main
struct CDSComponentsApp: App {
    
    init() {
        CDSThemeCore.setTheme(theme: CDSCarotaTheme())
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
