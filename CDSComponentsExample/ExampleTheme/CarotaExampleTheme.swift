//
//  CarotaExampleTheme.swift
//  CDSComponents_Example
//
//  Created by Elias Ferreira on 09/03/25.
//

import Foundation
import CDSComponents

public class CarotaExampleTheme: CDSTheme {
    
    
    public var colors: [String: String] = exampleColors
    public var sizes: [String: Float] = exampleSize
    public var fonts: [String: CDSFont] = exampleText
    
    public enum Fonts: String {
        case poppinsMediun = "Poppins-Medium.ttf"
        case poppinsSemiBold = "Poppins-SemiBold.ttf"
    }
    
    public var bundle: Bundle {
        Bundle(for: CarotaExampleTheme.self)
    }
    
    static var exampleColors: [String: String] = [
        "black": "#222222",
        "darkGray" : "#596386",
        "gray" : "#CFCFE7",
        "lightGray" : "#F3F3FB",
        "white" : "#FFFFFF",
        "primary" : "#54D09E",
        "secondary" : "#F9C562",
        "error" : "#FD7557"
    ]
    
    static var exampleSize: [String: Float] = [
        // Button
        "margin": 24,
        "buttonSize": 58,
        "buttonSmallSize": 45,
        "buttonIconSize": 18,
        "buttonIconSmallSize": 15,
        "buttonCornerRadius": 16,
        "buttonSmallCornerRadius": 14,
        "buttonLineWidht": 2,
        "buttonSmallLineWidht": 1.5,
        "buttonSpacing": 18,
        "buttonPadding": 20,
        "buttonSmallPadding": 15,
        // TextField
        "textFieldIconSize": 20,
        "textFieldLineWidth": 1,
        "textFieldHeight": 58,
        "textFieldCornerRadius": 16,
        "textFieldSpacing": 8,
        // LoadingCircle
        "loadingCircleTinnySize": 16,
        "loadingCircleSmallSize": 24,
        "loadingCircleMediumSize": 32,
        "loadingCircleLargeSize": 48,
        "loadingCircleXlargeSize": 64,
        "loadingCircleTinnyLineWidth": 2,
        "loadingCircleSmallMediumLineWidth": 3,
        "loadingCircleLargeLineWidth": 4,
        "loadingCircleXlargeLineWidth": 5
    ]
    
    static var exampleText: [String: CDSFont] = [
        // Component
        "buttonFont": CDSFont(Fonts.poppinsMediun.rawValue, size: 18),
        "textFieldFont": CDSFont(Fonts.poppinsMediun.rawValue, size: 16),
        "actionLabelFont": CDSFont(Fonts.poppinsMediun.rawValue, size: 14),
        // Title
        "largeTitle": CDSFont(Fonts.poppinsSemiBold.rawValue, size: 24),
        "title": CDSFont(Fonts.poppinsSemiBold.rawValue, size: 20),
        "subtitle": CDSFont(Fonts.poppinsSemiBold.rawValue, size: 16),
        // Content
        "largeContent": CDSFont(Fonts.poppinsMediun.rawValue, size: 16),
        "content": CDSFont(Fonts.poppinsMediun.rawValue, size: 14),
        "smallContent": CDSFont(Fonts.poppinsMediun.rawValue, size: 13),
        // Tag
        "tag": CDSFont(Fonts.poppinsMediun.rawValue, size: 10)
    ]
}
