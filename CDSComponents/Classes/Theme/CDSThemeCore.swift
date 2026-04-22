//
//  CDSThemeCore.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 26/08/24.
//

import SwiftUI

public class CDSThemeConfig {
    public static var shared = CDSThemeConfig()
    
    var theme: CDSTheme = DefaultTheme()
    
    private init() {}
    
    public func setTheme(theme: CDSTheme) {
        self.theme = theme
    }
}
