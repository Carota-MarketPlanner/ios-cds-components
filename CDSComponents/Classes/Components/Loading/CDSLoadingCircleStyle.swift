//
//  CDSLoadingCircleStyle.swift
//  Pods
//
//  Created by Elias Ferreira on 17/03/25.
//

import Foundation

public enum CDSLoadingCircleStyle {
    case `default`(size: CDSLoadingCircleSize = .medium)
    case onBrand(size: CDSLoadingCircleSize = .medium)
    
    public enum CDSLoadingCircleSize {
        case tinny
        case small
        case medium
        case large
        case xlarge
    }
}
