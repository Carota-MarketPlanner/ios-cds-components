//
//  CDSText.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 27/08/24.
//

import SwiftUI

public protocol CDSText {
    var buttonFont: CDSFont { get }
    var textFieldFont: CDSFont { get }
    var actionLabelFont: CDSFont { get }
}

public struct CDSFont {
    private var fileWihtExt: String
    var name: String
    var size: CGFloat
    
    public init(_ fileName: String, fontName: String? = nil, size: CGFloat) {
        self.fileWihtExt = fileName
        self.size = size
        self.name = fontName ?? NSString(string: fileName).deletingPathExtension
    }
    
    var fileName: String {
        NSString(string: self.fileWihtExt).deletingPathExtension
    }
    
    var `extension`: String {
        NSString(string: self.fileWihtExt).pathExtension
    }
    
    public var font: Font {
        .custom(cdsFont: self)
    }
}


