//
//  RotationAnimation.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 20.12.2021.
//

import SwiftUI

struct RotationAnimation: View {
    
    @State var animationAmount: Double = 1.0
    
    let animationDuration: Double = 1
    
    var body: some View {
        Button("Rotate me") {
            withAnimation(.easeOut) {
                animationAmount += 180
            }
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

#if DEBUG
struct RotationAnimation_Previews: PreviewProvider {
    static var previews: some View {
        RotationAnimation()
    }
}
#endif
