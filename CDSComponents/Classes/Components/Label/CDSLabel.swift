//
//  CDSLabel.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 01/09/24.
//

import SwiftUI

public struct CDSLabel: View {
    var styleBuilder: CDSLabelStyleBuilder
    
    public init(style: CDSLabelStyle) {
        self.styleBuilder = CDSLabelStyleBuilder(style: style)
    }
    
    public var body: some View {
        Text(styleBuilder.text)
            .foregroundStyle(styleBuilder.color)
            .font(styleBuilder.font)
    }
}
