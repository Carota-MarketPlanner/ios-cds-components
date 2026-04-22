//
//  CDSLoadingCircle.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 17/03/25.
//

import SwiftUI

struct CDSLoadingCircle: View {
    
    private let styleBuilder: CDSLoadingCircleStyleBuilder
    
    @State private var isAnimating = false
    
    public init(style: CDSLoadingCircleStyle) {
        self.styleBuilder = CDSLoadingCircleStyleBuilder(style: style)
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    styleBuilder.color.opacity(styleBuilder.opacity),
                    lineWidth: styleBuilder.lineWidth
                )
                .frame(width: styleBuilder.size, height: styleBuilder.size)

            Circle()
                .trim(from: .zero, to: styleBuilder.trim) // Controla o tamanho do arco
                .stroke(
                    styleBuilder.color,
                    style: StrokeStyle(
                        lineWidth: styleBuilder.lineWidth,
                        lineCap: .round
                    )
                )
                .frame(width: styleBuilder.size, height: styleBuilder.size)
                .rotationEffect(Angle(degrees: isAnimating ? styleBuilder.degrees : .zero))
                .animation(
                    Animation
                        .linear(duration: styleBuilder.duration)
                        .repeatForever(autoreverses: false), value: isAnimating
                )
        }
        .onAppear {
            isAnimating = true
        }
    }
}
