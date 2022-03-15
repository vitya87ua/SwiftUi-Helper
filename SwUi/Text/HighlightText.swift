//
//  HighlightText.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 15.03.2022.
//

import SwiftUI

struct HighlightText: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            
            Text("Hello, World!", highlight: "World")
        }
        .font(.title)
    }
}

// Very good use for highlight searching text
extension Text {
    init(_ text: String, highlight: String, highlightColor: Color = .orange.opacity(0.5)) {
        var attributedString = AttributedString(text)
        
        // Create Lowercased AttributedString to avoid sensitive search text to register
        let lowercasedAttributedString = AttributedString(text.lowercased())
        let lowercasedHighlight = highlight.lowercased()
        
        if let range = lowercasedAttributedString.range(of: lowercasedHighlight) {
            attributedString[range].backgroundColor = highlightColor
        }
        
        self.init(attributedString)
    }
}


#if DEBUG
struct HighlightText_Previews: PreviewProvider {
    static var previews: some View {
        HighlightText()
    }
}
#endif
