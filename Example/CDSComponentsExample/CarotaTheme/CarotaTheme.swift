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
    public var colors: CDSColor = CDSCarotaColor()
}

public class CDSCarotaColor: CDSColor {
    public var black = Hex("#222222")
    
    public var darkGray = Hex("#596386")
    
    public var gray = Hex("#CFCFE7")
    
    public var lightGray = Hex("#F3F3FB")
    
    public var white = Hex("#FFFFFF")
    
    public var green = Hex("#54D09E")
    
    public var yellow = Hex("#F9C562")
    
    public var orange = Hex("#FD7557")
}
