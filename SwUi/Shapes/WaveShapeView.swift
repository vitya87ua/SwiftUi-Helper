//
//  WaveShapeView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 08.03.2023.
//

import SwiftUI

struct WaveShape: Shape {
    
    var gap: CGFloat
    
    init(gap: CGFloat) {
        self.gap = gap
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: rect.origin)
            path.addQuadCurve(
                to: .init(x: rect.midX, y: rect.minY),
                control: .init(x: rect.minX + rect.quarterX, y: rect.minY + gap)
            )
            path.addQuadCurve(
                to: .init(x: rect.maxX, y: rect.minY),
                control: .init(x: rect.midX + rect.quarterX, y: rect.minY - gap)
            )
            path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
            
            path.addQuadCurve(
                to: .init(x: rect.midX, y: rect.maxY),
                control: .init(x: rect.midX + rect.quarterX, y: rect.maxY - gap)
            )
            path.addQuadCurve(
                to: .init(x: rect.minX, y: rect.maxY),
                control: .init(x: rect.minX + rect.quarterX, y: rect.maxY + gap)
            )
            path.addLine(to: .init(x: rect.minX, y: rect.minY))
        }
    }
}

struct WaveShapeView: View {
    var body: some View {
        VStack(spacing: 40) {
            WaveShape(gap: 25)
                .fill(Color.gray)
                .frame(width: 400, height: 200, alignment: .center)
            
            WaveShape(gap: 20)
                .stroke(Color.red, lineWidth: 1)
                .frame(width: 400, height: 150, alignment: .center)
        }
    }
}

#if DEBUG
struct WaveShapeView_Previews: PreviewProvider {
    static var previews: some View {
        WaveShapeView()
    }
}
#endif
