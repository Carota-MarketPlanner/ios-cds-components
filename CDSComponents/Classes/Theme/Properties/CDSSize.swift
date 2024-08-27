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
    var buttonHeight: CGFloat { get }
    var buttonIconHeight: CGFloat { get }
    var buttonCornerRadius: CGFloat { get }
    var buttonLineWidht: CGFloat { get }
    var buttonSpacing: CGFloat { get }
}
