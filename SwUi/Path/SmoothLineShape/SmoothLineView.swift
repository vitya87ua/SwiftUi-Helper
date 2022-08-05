//
//  SmoothLineView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 05.08.2022.
//

import SwiftUI

struct SmoothLineView: View {
    
    let points: [CGPoint] = [
        .init(x: 50, y: 50),
        .init(x: 200, y: 200),
        .init(x: 300, y: 200),
        .init(x: 300, y: 300),
        .init(x: 70, y: 300),
        .init(x: 40, y: 400),
        .init(x: 250, y: 400)]
    
    var body: some View {
        VStack {
            SmoothLineShape(points: points, smoothLine: true)
                .stroke(.red,
                        style: StrokeStyle(
                            lineWidth: 3,
                            lineCap: .round,
                            lineJoin: .round)
                )
                .equalFrame(400)
            Spacer()
            SmoothLineShape(points: points, smoothLine: false)
                .stroke(.green,
                        style: StrokeStyle(
                            lineWidth: 3,
                            lineCap: .round,
                            lineJoin: .round)
                )
                .equalFrame(400)
        }
    }
}

#if DEBUG
struct SmoothLineView_Previews: PreviewProvider {
    static var previews: some View {
        SmoothLineView()
    }
}
#endif
