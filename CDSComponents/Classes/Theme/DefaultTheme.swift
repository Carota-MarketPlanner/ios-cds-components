//
//  DefaultTheme.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 22/04/26.
//

import Foundation

class DefaultTheme: CDSTheme {
    public var bundle: Bundle {
        Bundle(for: DefaultTheme.self)
    }
    
    var error: String = "No theme configured"
    
    var colors: [String: String] {
        fatalError(error)
    }
    var sizes: [String: Float] {
        fatalError(error)
    }
    var fonts: [String: CDSFont] {
        fatalError(error)
    }
}
