//
//  CDSColor.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 26/08/24.
//

import SwiftUI

public protocol CDSColor {
    var black: Hex { get }
    var darkGray: Hex { get }
    var gray: Hex { get }
    var lightGray: Hex { get }
    var white: Hex { get }
    var primary: Hex { get }
    var secondary: Hex { get }
    var error: Hex { get }
}

public struct Hex {
    public var hex: String
    
    public init(_ hex: String) {
        self.hex = hex
    }
    
    public var color: Color {
        Color(hex: hex)
    }
}


