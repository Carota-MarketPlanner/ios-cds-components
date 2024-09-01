//
//  CDSLabelStyleBuilder.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 01/09/24.
//

import SwiftUI

class CDSLabelStyleBuilder {
    @CDSThemeCore var theme: CDSTheme
    
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
        case .primary: theme.colors.black.color
        case .secondary: theme.colors.darkGray.color
        case .onColor: theme.colors.white.color
        }
    }
    
    var font: Font {
        switch type {
        case .largeTitle: theme.fonts.largeTitle.font
        case .title: theme.fonts.title.font
        case .subtitle: theme.fonts.subtitle.font
        case .largeContent: theme.fonts.largeContent.font
        case .content: theme.fonts.content.font
        case .smallContent: theme.fonts.smallContent.font
        case .tag: theme.fonts.tag.font
        }
    }
}
