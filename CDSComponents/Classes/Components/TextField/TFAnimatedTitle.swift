//
//  TFAnimatedTitle.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 28/08/24.
//

import SwiftUI

struct TFAnimatedTitle: View {
    var title: String
    var selected: Bool
    
    @State private var offset: CGFloat = 35
    
    var body: some View {
        Text(title)
            .offset(x: 0, y: offset)
            .animation(.easeOut(duration: 0.3), value: offset)
            .onChange(of: selected) { newValue in
                offset = newValue ? 35 : 0
            }
    }
}
