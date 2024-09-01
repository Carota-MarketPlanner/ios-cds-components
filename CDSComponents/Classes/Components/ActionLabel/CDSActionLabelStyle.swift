//
//  CDSActionLabelStyle.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 01/09/24.
//

import Foundation

public enum CDSActionLabelStyle {
    case text(text: String)
    case button(text: String, action: () -> Void)
    case link(text: String, url: String)
    
    var link: String {
        switch self {
        case .text(let text), .link(_, let text), .button(let text, _):
            text.replacingOccurrences(of: " ", with: "")
        }
    }
}
