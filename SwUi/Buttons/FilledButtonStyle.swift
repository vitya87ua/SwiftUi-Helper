//
//  FilledButtonStyle.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 22.12.2023.
//

import SwiftUI

struct FilledButtonStyle: ButtonStyle {
    
    var color: Color
    let cornerRadius: CGFloat
    
    init(color: Color = .purple, cornerRadius: CGFloat = 12) {
        self.color = color
        self.cornerRadius = cornerRadius
    }
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(color.opacity(configuration.isPressed ? 0.6 : 1))
            
            configuration.label
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
        }
    }
}

extension ButtonStyle where Self == FilledButtonStyle {
    static var filled: FilledButtonStyle { FilledButtonStyle() }
}

struct FilledButtonStyleView: View {
    var body: some View {
        VStack(spacing: 12) {
            Button("Add Material", action: {})
                .buttonStyle(.filled)
                .frame(height: 52)
            
            Button("Add Material", action: {})
                .buttonStyle(.filled)
                .frame(width: 200, height: 44)
        }
        .padding()
    }
}

#Preview {
    FilledButtonStyleView()
}
