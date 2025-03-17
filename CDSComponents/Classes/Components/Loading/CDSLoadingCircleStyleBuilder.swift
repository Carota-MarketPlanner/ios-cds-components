//
//  CDSLoadingCircleStyleBuilder.swift
//  Pods
//
//  Created by Elias Ferreira on 17/03/25.
//

import SwiftUI

class CDSLoadingCircleStyleBuilder {
    @CDSThemeCore var theme: CDSTheme
    
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
            theme.colors.primary.color
        case .onBrand(_):
            theme.colors.white.color
        }
    }
    
    public var size: CGFloat {
        switch style {
        case .default(let size), .onBrand(let size):
            switch size {
            case .tinny:
                return theme.sizes.loadingCircleTinnySize
                
            case .small:
                return theme.sizes.loadingCircleSmallSize
                
            case .medium:
                return theme.sizes.loadingCircleMediumSize
                
            case .large:
                return theme.sizes.loadingCircleLargeSize
                
            case .xlarge:
                return theme.sizes.loadingCircleXlargeSize
            }
        }
    }
    
    public var lineWidth: CGFloat {
        switch style {
        case .default(let size), .onBrand(let size):
            switch size {
            case .tinny:
                return theme.sizes.loadingCircleTinnyLineWidth
                
            case .small, .medium:
                return theme.sizes.loadingCircleSmallMediumLineWidth
                
            case .large:
                return theme.sizes.loadingCircleLargeLineWidth
                
            case .xlarge:
                return theme.sizes.loadingCircleXlargeLineWidth
            }
        }
    }
}
