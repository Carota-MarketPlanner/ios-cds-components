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
                 state: CDSButtonState = .enabled)
    
    case secondary(type: CDSButtonType = .default,
                   size: CDSButtonSize = .normal,
                   state: CDSButtonState = .enabled)
    
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
    
    public enum CDSButtonState {
        case enabled
        case disabled
    }
}
