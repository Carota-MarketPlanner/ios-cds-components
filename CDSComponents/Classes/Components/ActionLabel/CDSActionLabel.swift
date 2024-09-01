//
//  CDSActionLabel.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 01/09/24.
//

import SwiftUI

public struct CDSActionLabel: View {
    var styleBuilder: CDSActionLabelStyleBuilder
    
    public init(content: [CDSActionLabelStyle]) {
        self.styleBuilder = CDSActionLabelStyleBuilder(content: content)
    }
    
    public var body: some View {
        Text(.init(styleBuilder.textLinks))
            .environment(\.openURL, OpenURLAction { url in
                styleBuilder.perform(for: url)
            })
            .foregroundColor(styleBuilder.foreground)
            .tint(styleBuilder.tint)
            .font(styleBuilder.font)
    }
}
