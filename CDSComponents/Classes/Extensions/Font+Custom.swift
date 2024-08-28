//
//  Font+Custom.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 27/08/24.
//

import SwiftUI

extension Font {
    static func register(font: CDSFont) {
        if let fontPath = Bundle.main.path(forResource: font.fileName, ofType: font.extension),
           let fontData = NSData(contentsOfFile: fontPath),
           let dataProvider = CGDataProvider(data: fontData),
           let font = CGFont(dataProvider) {
            var error: Unmanaged<CFError>?
            if !CTFontManagerRegisterGraphicsFont(font, &error) {
                fatalError("Faild to register font")
            }
        } else {
            fatalError("Faild to register font")
        }
    }
    
    static func custom(cdsFont: CDSFont) -> Font {
        if UIFont(name: cdsFont.name, size: cdsFont.size) == nil {
            Font.register(font: cdsFont)
        }
        
        return .custom(cdsFont.name, fixedSize: cdsFont.size)
    }
}
