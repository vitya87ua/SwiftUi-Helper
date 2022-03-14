//
//  EqualFrameModifierView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 14.03.2022.
//

import SwiftUI

struct EqualFrameModifierView: View {
    var body: some View {
        VStack {
            Text("EqualFrameModifier")

            Circle()
                .equalFrame(50)
            
            Circle()
                .equalFrame(100)
        }
    }
}

struct EqualFrameModifier: ViewModifier {
    
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: size, height: size, alignment: .center)
    }
}

extension View {
    
    /// .equalFrame(100) is the same as  .frame(width: 100, height: 100)
    func equalFrame(_ size: CGFloat) -> some View {
        self.modifier(EqualFrameModifier(size: size))
    }
}

#if DEBUG
struct EqualFrameModifierView_Previews: PreviewProvider {
    static var previews: some View {
        EqualFrameModifierView()
    }
}
#endif
