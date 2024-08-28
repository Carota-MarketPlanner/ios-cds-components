//
//  CDSIconButton.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 27/08/24.
//

import SwiftUI

public struct CDSIconButton: View {
    private let icon: String
    private let action: () -> Void
    
    public init(icon: String, action: @escaping () -> Void) {
        self.icon = icon
        self.action = action
    }
    
    
    public var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 18)
                    .frame(maxHeight: 18)
            }
            .padding(20)
            .frame(width: 58, height: 58)
            .background(.white)
            .foregroundColor(.green)
            .cornerRadius(16)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.green, lineWidth: 2)
            }
        }
        
    }
}
