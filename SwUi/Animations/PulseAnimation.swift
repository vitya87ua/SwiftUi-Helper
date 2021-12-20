//
//  PulseAnimation.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 20.12.2021.
//

import SwiftUI

struct PulseAnimation: View {
    
    @State var animationAmount: Double = 1.0
    
    let animationDuration: Double = 1
    
    var body: some View {
        Button("Tap here") {
            
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 2)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
        
    }
}

#if DEBUG
struct PulseAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PulseAnimation()
    }
}
#endif
