//
//  CDSLabelStyle.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 01/09/24.
//

import Foundation

public enum CDSLabelStyle {
    case primary(_ text: String, type: CDSLabelType)
    case secondary(_ text: String, type: CDSLabelType)
    case onColor(_ text: String, type: CDSLabelType)
    
    public enum CDSLabelType {
        case largeTitle
        case title
        case subtitle
        case largeContent
        case content
        case smallContent
        case tag
    }
}
