//
//  AnimationsWithTransitions.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 20.12.2021.
//

import SwiftUI

struct AnimationsWithTransitions: View {
    
    @State var isShowed: Bool = true
    
    let animationDuration: Double = 1
    
    var body: some View {
        VStack(spacing: 30) {
            
            Button("Animate") {
                withAnimation {
                    isShowed.toggle()
                }
            }
            
            if isShowed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 50)
                    .cornerRadius(10)
                    .transition(.identity)
            }
            
            if isShowed {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 200, height: 50)
                    .cornerRadius(10)
                    .transition(.opacity)
            }
            
            if isShowed {
                Rectangle()
                    .fill(.green)
                    .frame(width: 200, height: 50)
                    .cornerRadius(10)
                    .transition(.scale(scale: 2))
            }
            
            if isShowed {
                Rectangle()
                    .fill(.orange)
                    .frame(width: 200, height: 50)
                    .cornerRadius(10)
                    .transition(.slide)
            }
            
            if isShowed {
                Rectangle()
                    .fill(.purple)
                    .frame(width: 200, height: 50)
                    .cornerRadius(10)
                    .transition(.move(edge: .bottom))
            }
        }
    }
}

#if DEBUG
struct AnimationsWithTransitions_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsWithTransitions()
    }
}
#endif
