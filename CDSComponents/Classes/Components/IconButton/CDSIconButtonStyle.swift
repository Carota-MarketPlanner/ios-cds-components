//
//  CDSIconButtonStyle.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 28/08/24.
//

import Foundation

public enum CDSIconButtonStyle {
    case primary(type: CDSIconButtonType = .default())
    case secondary(type: CDSIconButtonType = .default())
    
    public enum CDSIconButtonType {
        case `default`(size: CDSIconButtonSize = .normal, disabled: Bool = false)
        case stroked(size: CDSIconButtonSize = .normal, disabled: Bool = false)
        
        public enum CDSIconButtonSize {
            case normal
            case small
        }
    }
}
