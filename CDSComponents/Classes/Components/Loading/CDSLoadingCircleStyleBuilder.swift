//
//  CDSLoadingCircleStyleBuilder.swift
//  Pods
//
//  Created by Elias Ferreira on 17/03/25.
//

import SwiftUI

class CDSLoadingCircleStyleBuilder {
    // MARK: - Public Properties
    
    var opacity: CGFloat { 0.3 }
    var trim: CGFloat { 0.6 }
    var degrees: CGFloat { 360 }
    var duration: Double { 0.6 }
    
    // MARK: - Private Properties
    
    private let style: CDSLoadingCircleStyle
    
    // MARK: - Initializer
    
    init(style: CDSLoadingCircleStyle) {
        self.style = style
    }
    
    // MARK: - Public View Properties
    
    public var color: Color {
        switch style {
        case .default(_):
            CDSColor.primary.color
        case .onBrand(_):
            CDSColor.white.color
        }
    }
    
    public var size: CGFloat {
        switch style {
        case .default(let size), .onBrand(let size):
            switch size {
            case .tinny:
                return CDSSize.loadingCircleTinnySize.size
                
            case .small:
                return CDSSize.loadingCircleSmallSize.size
                
            case .medium:
                return CDSSize.loadingCircleMediumSize.size
                
            case .large:
                return CDSSize.loadingCircleLargeSize.size
                
            case .xlarge:
                return CDSSize.loadingCircleXlargeSize.size
            }
        }
    }
    
    public var lineWidth: CGFloat {
        switch style {
        case .default(let size), .onBrand(let size):
            switch size {
            case .tinny:
                return CDSSize.loadingCircleTinnyLineWidth.size
                
            case .small, .medium:
                return CDSSize.loadingCircleSmallMediumLineWidth.size
                
            case .large:
                return CDSSize.loadingCircleLargeLineWidth.size
                
            case .xlarge:
                return CDSSize.loadingCircleXlargeLineWidth.size
            }
        }
    }
}
