//
//  CDSFont.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 22/04/26.
//
import SwiftUI

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
