//
//  CDSSize.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 27/08/24.
//

import SwiftUI

public enum CDSSize: String {
    // Global
    case margin
    // Button
    case buttonSize
    case buttonSmallSize
    case buttonIconSize
    case buttonIconSmallSize
    case buttonCornerRadius
    case buttonSmallCornerRadius
    case buttonLineWidht
    case buttonSmallLineWidht
    case buttonSpacing
    case buttonPadding
    case buttonSmallPadding
    // TextField
    case textFieldIconSize
    case textFieldLineWidth
    case textFieldHeight
    case textFieldCornerRadius
    case textFieldSpacing
    // LoadingCircle
    case loadingCircleTinnySize
    case loadingCircleSmallSize
    case loadingCircleMediumSize
    case loadingCircleLargeSize
    case loadingCircleXlargeSize
    case loadingCircleTinnyLineWidth
    case loadingCircleSmallMediumLineWidth
    case loadingCircleLargeLineWidth
    case loadingCircleXlargeLineWidth
}

extension CDSSize: CDSPropertie {
    public var properties: [String : Any] {
        CDSThemeConfig.shared.theme.sizes
    }
    
    public var size: CGFloat {
        CGFloat(getPropertie(field: self.rawValue, ofType: Float.self))
    }
}
