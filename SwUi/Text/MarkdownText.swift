//
//  MarkdownText.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 25.05.2022.
//

import SwiftUI

struct MarkdownText: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Hello, *World!*")
            Text("Hello, **World!**")
            Text("Hello, ***World!***")
            Text("Hello, ~~World!~~")
            Text("Hello, [My Link](https://github.com/vitya87ua)")
            
            Text("Hello, [Link Color](https://github.com/vitya87ua)")
                .tint(.pink)
        }
    }
}

#if DEBUG
struct MarkdownText_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownText()
    }
}
#endif
