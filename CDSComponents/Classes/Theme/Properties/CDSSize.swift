//
//  CDSSize.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 27/08/24.
//

import SwiftUI

public protocol CDSSize {
    // Global
    var margin: CGFloat { get }
    // Button
    var buttonPadding: CGFloat { get }
    var buttonSize: CGFloat { get }
    var buttonSmallSize: CGFloat { get }
    var buttonIconSize: CGFloat { get }
    var buttonIconSmallSize : CGFloat { get }
    var buttonCornerRadius: CGFloat { get }
    var buttonSmallCornerRadius: CGFloat { get }
    var buttonLineWidht: CGFloat { get }
    var buttonSmallLineWidht: CGFloat { get }
    var buttonSpacing: CGFloat { get }
    // IconButton
    var iconButtonPadding: CGFloat { get }
    var iconButtonSmallPadding: CGFloat { get }
}
