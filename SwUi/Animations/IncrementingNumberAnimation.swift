//
//  IncrementingNumberAnimation.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 24.12.2021.
//

import SwiftUI

struct IncrementingNumberAnimation: View {
    
    @State var percent: CGFloat = 0
    
    @State var percent2: CGFloat = 0
    
    var body: some View {
        VStack {
            
            Circle()
                .fill(.blue)
                .frame(width: 200, height: 200)
                .modifier(AnimatintNumber(number: percent))
            
            Circle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .modifier(AnimatintNumber(number: percent2))
            
            Button("Go") {
                withAnimation(.easeInOut(duration: 1)) {
                    percent = 556
                    percent2 = 65
                }
            }
            
        }
    }
}

struct AnimatintNumber: AnimatableModifier {
    
    var number: CGFloat
    
    var animatableData: CGFloat {
        get { number }
        set { number = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(Text("\(Int(number))"))
    }
}

#if DEBUG
struct IncrementingNumberAnimation_Previews: PreviewProvider {
    static var previews: some View {
        IncrementingNumberAnimation()
    }
}
#endif
