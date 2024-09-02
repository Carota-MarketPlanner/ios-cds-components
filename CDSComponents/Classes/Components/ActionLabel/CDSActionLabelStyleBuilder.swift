//
//  CDSActionLabelStyleBuilder.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 01/09/24.
//

import SwiftUI

class CDSActionLabelStyleBuilder {
    @CDSThemeCore var theme: CDSTheme
    
    // MARK: - Private Properties
    
    private var content: [CDSActionLabelStyle]
    
    // MARK: - Initializer
    
    init(content: [CDSActionLabelStyle]) {
        self.content = content
    }
    
    // MARK: - Public View Properties
    
    var foreground: Color { theme.colors.darkGray.color }
    var tint: Color { theme.colors.primary.color }
    var font: Font { theme.fonts.actionLabelFont.font }
    
    var textLinks: String {
        var string = String()
        content.forEach { type in
            switch type {
            case .text(let text):
                string.append(text)
                
            case .button(let text, _), .link(let text, _):
                string.append("[\(text)](\(type.link))")
            }
        }
        
        return string
    }
    
    // MARK: - Public Functions
    
    func perform(for url: URL) -> OpenURLAction.Result {
        if let type = content.first(where: { $0.link == url.absoluteString }) {
            return result(for: type)
        }
        
        return .discarded
    }
    
    // MARK: - Private Functions
    
    private func result(for type: CDSActionLabelStyle) ->  OpenURLAction.Result {
        switch type {
        case .button(_, let action):
            action(); return .handled
        case .link: return .systemAction
        case .text: break
        }
        
        return .discarded
    }
}
