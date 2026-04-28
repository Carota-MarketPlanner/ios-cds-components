//
//  TFAnimatedTitle.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 28/08/24.
//

import SwiftUI

struct CDSFloatingText: View {
    var title: String
    var selected: Bool
    var background: Color
    
    var body: some View {
        Text(title)
            .padding(.horizontal, 6)
            .background(background)
            .offset(x: 18, y: selected ? -33 : 0)
            .scaleEffect(selected ? 0.85 : 1, anchor: .leading)
            .animation(.easeOut(duration: 0.3), value: selected)
    }
}
