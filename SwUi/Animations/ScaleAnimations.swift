//
//  ScaleAnimations.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 20.12.2021.
//

import SwiftUI

struct ScaleAnimations: View {
    
    @State var animationAmount1: Double = 1.0
    @State var animationAmount2: Double = 1.0
    @State var animationAmount3: Double = 1.0
    @State var animationAmount4: Double = 1.0
    @State var animationAmount5: Double = 1.0
    
    let animationDuration: Double = 1
    
    var body: some View {
        VStack(spacing: 60) {
            Button("easeIn") {
                animationAmount1 += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount1)
            .animation(.easeIn(duration: animationDuration), value: animationAmount1)
            
            Button("easeOut") {
                animationAmount2 += 1
            }
            .padding(40)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount2)
            .animation(.easeOut(duration: animationDuration), value: animationAmount2)
            
            Button("easeInOut") {
                animationAmount3 += 1
            }
            .padding(40)
            .background(Color.green)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount3)
            .animation(.easeInOut(duration: animationDuration), value: animationAmount3)
            
            Button("linear") {
                animationAmount4 += 1
            }
            .padding(40)
            .background(Color.purple)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount4)
            .animation(.linear(duration: animationDuration), value: animationAmount4)
            
            Button("linear +") {
                animationAmount5 += 1
            }
            .padding(40)
            .background(Color.pink)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount5)
            .animation(
                .linear(duration: animationDuration)
                    .delay(1)
                    .repeatCount(3, autoreverses: true),
                value: animationAmount5
            )
        }
    }
}

#if DEBUG
struct ScaleAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ScaleAnimations()
    }
}
#endif
