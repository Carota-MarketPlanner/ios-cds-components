//
//  CarotaTheme.swift
//  CDSComponents_Example
//
//  Created by Elias Ferreira on 26/08/24.
//

import CDSComponents
import SwiftUI

public class CDSCarotaTheme: CDSTheme {
    public init() {}
    
    public var colors = CDSCarotaColor.shared
    public var sizes = CDSCarotaSize.shared
    public var fonts = CDSCarotaText.shared
}

public class CDSCarotaColor: CDSColor {
    public static var shared: CDSColor = CDSCarotaColor()
    
    private init() {}
    
    public var black = Hex("#222222")
    public var darkGray = Hex("#596386")
    public var gray = Hex("#CFCFE7")
    public var lightGray = Hex("#F3F3FB")
    public var white = Hex("#FFFFFF")
    public var primary = Hex("#54D09E")
    public var secondary = Hex("#F9C562")
    public var error = Hex("#FD7557")
}

public class CDSCarotaSize: CDSSize {
    public static var shared: CDSSize = CDSCarotaSize()
    
    private init() {}
    // Button
    public var margin: CGFloat = 24
    public var buttonSize: CGFloat = 58
    public var buttonSmallSize: CGFloat = 45
    public var buttonIconSize: CGFloat = 18
    public var buttonIconSmallSize: CGFloat = 15
    public var buttonCornerRadius: CGFloat = 16
    public var buttonSmallCornerRadius: CGFloat = 14
    public var buttonLineWidht: CGFloat = 2
    public var buttonSmallLineWidht: CGFloat = 1.5
    public var buttonSpacing: CGFloat = 18
    public var buttonPadding: CGFloat = 20
    public var buttonSmallPadding: CGFloat = 15
    // TextField
    public var textFieldIconSize: CGFloat = 20
    public var textFieldLineWidth: CGFloat = 1
    public var textFieldHeight: CGFloat = 29
    public var textFieldSpacing: CGFloat = 10
}

public class CDSCarotaText: CDSText {
    public enum Fonts: String {
        case poppinsMediun = "Poppins-Medium.ttf"
        case poppinsSemiBold = "Poppins-SemiBold.ttf"
    }
    
    public static var shared: CDSText = CDSCarotaText()
    
    private init() {}
    
    public var buttonFont = CDSFont(Fonts.poppinsMediun.rawValue, size: 18)
    public var textFieldFont = CDSFont(Fonts.poppinsMediun.rawValue, size: 16)
}
