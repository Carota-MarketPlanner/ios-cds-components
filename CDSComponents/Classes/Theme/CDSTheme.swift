//
//  CDSTheme.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 26/08/24.
//

import SwiftUI

public protocol CDSTheme {
    var colors: [String: String] { get }
    var sizes: [String: Float] { get }
    var fonts: [String: CDSFont] { get }
    var bundle: Bundle { get }
}
