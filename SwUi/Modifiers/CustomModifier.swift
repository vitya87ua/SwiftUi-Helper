//
//  CustomModifier.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 18.11.2021.
//

import SwiftUI

struct CustomModifier: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, World!")
                .modifier(Purples())
            
            Text("Hello, Mars!")
                .purples()
            
            Text("Hello, Upiter!")
        }
        .font(.system(size: 40, weight: .bold))
    }
}

struct Purples: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.purple)
    }
}

extension View {
    func purples() -> some View {
        self.modifier(Purples())
    }
}

#if DEBUG
struct CustomModifier_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifier()
    }
}
#endif
