//
//  CDSButtonStyle.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 24/08/24.
//

import Foundation

public enum CDSButtonStyle {
    case primary(type: CDSButtonType = .default,
                 size: CDSButtonSize = .normal,
                 disabled: Bool = false)
    
    case secondary(type: CDSButtonType = .default,
                   size: CDSButtonSize = .normal,
                   disabled: Bool = false)
    
    public enum CDSButtonType {
        case `default`
        case iconed(position: CDSButtonIconPosition)
        
        public enum CDSButtonIconPosition {
            case left(name: String)
            case right(name: String)
        }
    }
    
    public enum CDSButtonSize {
        case normal
        case infinity
    }
}
