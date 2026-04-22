//
//  CDSLabelStyleBuilder.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 01/09/24.
//

import SwiftUI

class CDSLabelStyleBuilder {
    
    typealias LabelType = CDSLabelStyle.CDSLabelType
    
    var style: CDSLabelStyle
    
    init(style: CDSLabelStyle) {
        self.style = style
    }
    
    var text: String {
        switch style {
        case .primary(let text, _), .secondary(let text, _), .onColor(let text, _):
            return text
        }
    }
    
    var type: LabelType {
        switch style {
        case .primary(_, let type), .secondary(_, let type), .onColor(_, let type):
            return type
        }
    }
    
    var color: Color {
        switch style {
        case .primary: CDSColor.black.color
        case .secondary: CDSColor.darkGray.color
        case .onColor: CDSColor.white.color
        }
    }
    
    var font: Font {
        switch type {
        case .largeTitle: CDSText.largeTitle.font
        case .title: CDSText.title.font
        case .subtitle: CDSText.subtitle.font
        case .largeContent: CDSText.largeContent.font
        case .content: CDSText.content.font
        case .smallContent: CDSText.smallContent.font
        case .tag: CDSText.tag.font
        }
    }
}
