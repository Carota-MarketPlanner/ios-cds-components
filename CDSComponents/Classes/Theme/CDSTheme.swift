//
//  CDSTheme.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 26/08/24.
//

import SwiftUI

public protocol CDSTheme {
    var colors: CDSColor { get }
    var sizes: CDSSize { get }
    var fonts: CDSText { get }
    var bundle: Bundle { get }
}
