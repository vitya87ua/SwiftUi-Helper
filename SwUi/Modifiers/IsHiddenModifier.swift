//
//  IsHiddenModifier.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 14.04.2022.
//

import SwiftUI

struct IsHiddenModifier: ViewModifier {
    
    var hidden: Bool
    
    func body(content: Content) -> some View {
        if hidden {
            content.hidden()
        } else {
            content
        }
    }
}

extension View {
    func isHidden(_ hidden: Bool) -> some View {
        self.modifier(IsHiddenModifier(hidden: hidden))
    }
}

#if DEBUG
struct IsHiddenModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center, spacing: 20) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow)
                .equalFrame(100)
                
            // Hidden View
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow)
                .equalFrame(100)
                .isHidden(true)
                .border(Color.red, width: 1)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow)
                .equalFrame(100)
        }
    }
}
#endif
