//
//  CDSText.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 27/08/24.
//

import SwiftUI

public enum CDSText: String {
    // Component
    case buttonFont
    case textFieldFont
    case actionLabelFont
    // Title
    case largeTitle
    case title
    case subtitle
    // Content
    case largeContent
    case content
    case smallContent
    // Tag
    case tag
}

extension CDSText: CDSPropertie {
    public var properties: [String : Any] {
        CDSThemeConfig.shared.theme.fonts
    }
    
    public var font: Font {
        getPropertie(field: self.rawValue, ofType: CDSFont.self).font
    }
}
