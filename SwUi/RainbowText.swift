//
//  RainbowText.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 18.11.2021.
//

import SwiftUI

struct RainbowText: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(textArray(text).indices) {
                Text(textArray(text)[$0])
                    .foregroundColor(Color.random)
            }
        }
    }
    
    private func textArray(_ text: String) -> [String] {
        Array(text).map { String($0) }
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

#if DEBUG
struct RainbowText_Previews: PreviewProvider {
    static var previews: some View {
        RainbowText("Hello, World!")
            .font(.system(size: 55).bold())
    }
}
#endif
