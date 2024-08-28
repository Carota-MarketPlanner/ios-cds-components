//
//  CDSThemeCore.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 26/08/24.
//

import SwiftUI

@propertyWrapper
public struct CDSThemeCore {
    private static var theme: CDSTheme?
    
    public var wrappedValue: CDSTheme {
        return getTheme()
    }
    
    public init() {}
    
    public static func setTheme(theme: CDSTheme) {
        if self.theme == nil {
            self.theme = theme
        }
    }
    
    private func getTheme() -> CDSTheme {
        guard let theme = CDSThemeCore.theme else {
            fatalError("Theme not found")
        }
        
        return theme
    }
}
