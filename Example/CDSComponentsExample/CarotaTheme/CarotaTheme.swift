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
    public var size = CDSCarotaSize.shared
}

public class CDSCarotaColor: CDSColor {
    public static var shared: CDSColor = CDSCarotaColor()
    
    private init() {}
    
    public var black = Hex("#222222")
    public var darkGray = Hex("#596386")
    public var gray = Hex("#CFCFE7")
    public var lightGray = Hex("#F3F3FB")
    public var white = Hex("#FFFFFF")
    public var green = Hex("#54D09E")
    public var yellow = Hex("#F9C562")
    public var orange = Hex("#FD7557")
}

public class CDSCarotaSize: CDSSize {
    public static var shared: CDSSize = CDSCarotaSize()
    
    private init() {}
    
    public var margin: CGFloat = 24
    public var buttonPadding: CGFloat = 24
    public var buttonHeight: CGFloat = 58
    public var buttonIconHeight: CGFloat = 18
    public var buttonCornerRadius: CGFloat = 16
    public var buttonLineWidht: CGFloat = 2
    public var buttonSpacing: CGFloat = 18
}
