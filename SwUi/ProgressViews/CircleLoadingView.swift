//
//  CircleLoadingView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 10.02.2022.
//

// A lot of animations https://github.com/amosgyamfi/swiftui-animation-library
import SwiftUI

struct CircleLoadingView: View {
    
    @State private var isSpinning = false
    
    var body: some View {
        ZStack {
            Text ("LOADING")
                .foregroundColor(.yellow)
                .shadow(color: .yellow, radius: 5, x: 1, y: 1)
            
            Circle() // GRAY CIRCLE
                .stroke(lineWidth: 5)
                .frame (width: 150, height: 150)
                .foregroundColor(Color.gray)
            
            Circle() //RING
                .trim(from: 0, to: 1/4)
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .frame (width: 150, height: 150)
                .foregroundColor(.yellow)
                .overlay(
                    Circle() // small circle at ring's tip
                        .frame(width: 15, height: 15)
                        .foregroundColor(.yellow)
                        .offset(x: 0, y: 75)
                ).shadow(color: .yellow, radius: 5, x: 1, y: 1)
                .offset()
                .rotationEffect(.degrees(isSpinning ? 360 : 0))
                .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: isSpinning)
                .onAppear {
                    self.isSpinning.toggle()
                }
        }
    }
}

#if DEBUG
struct CircleLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            
            CircleLoadingView()
        }
        .ignoresSafeArea()
    }
}
#endif
