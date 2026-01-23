//
//  DebugFrameView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 23.01.2026.
//

import SwiftUI

extension View {
    func debugFrame(_ color: Color = .red, lineWidth: CGFloat = 2) -> some View {
        self.overlay {
            GeometryReader { proxy in
                ZStack {
                    Rectangle()
                        .stroke(color, lineWidth: lineWidth)
                    
                    if #available(iOS 16.0, *) {
                        VStack {
                            Text("Local: " + proxy.frame(in: .local).debugDescription)
                            Text("Global: " + proxy.frame(in: .global).debugDescription)
                        }
                        .bold()
                        .minimumScaleFactor(0.5)
                        .foregroundStyle(color)
                    } else {
                        VStack {
                            Text("Local: " + proxy.frame(in: .local).debugDescription)
                            Text("Global: " + proxy.frame(in: .global).debugDescription)
                        }
                        .font(.system(size: 13, weight: .bold))
                        .minimumScaleFactor(0.5)
                        .foregroundStyle(color)
                    }
                }
            }
        }
    }
}

struct DebugFrameView: View {
    var body: some View {
        Text("Hello, World!")
            .debugFrame()
    }
}

#Preview {
    DebugFrameView()
}
