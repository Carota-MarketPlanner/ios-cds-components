//
//  CDSColor.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 26/08/24.
//

import SwiftUI

public enum CDSColor: String {
    case black
    case darkGray
    case gray
    case lightGray
    case white
    case primary
    case secondary
    case error
}

extension CDSColor: CDSPropertie {
    public var properties: [String: Any] {
        CDSThemeConfig.shared.theme.colors
    }
    
    public var color: Color {
        Color(hex: getPropertie(field: self.rawValue, ofType: String.self))
    }
}
