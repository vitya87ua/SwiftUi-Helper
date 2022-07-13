//
//  DirectArrowView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 12.07.2022.
//

import SwiftUI

struct DirectArrowView: View {
    
    let start: CGPoint
    let end: CGPoint
    
    var length: CGFloat {
        hypot(end.x - start.x, end.y - start.y)
    }

    var cosine: CGFloat {
        (end.x - start.x) / length
    }
    
    var sine: CGFloat {
        (end.y - start.y) / length
    }
    
    var transform: CGAffineTransform {
        CGAffineTransform(a: cosine, b: sine, c: -sine, d: cosine, tx: start.x, ty: start.y)
    }
    
    var body: some View {
        DirectArrowShape(start: start, end: end, tailWidth: 20, headWidth: 35, headLength: 35)
            .transform(transform)
    }
}

#if DEBUG
struct DirectArrowView_Previews: PreviewProvider {
    static var previews: some View {
        DirectArrowView(
            start: CGPoint(x: 20, y: 20),
            end: CGPoint(x: 200, y: 200)
        )
    }
}
#endif

struct DirectArrowShape: Shape {
    
    let start: CGPoint, end: CGPoint, tailWidth: CGFloat, headWidth: CGFloat, headLength: CGFloat
    
    var length: CGFloat {
        hypot(end.x - start.x, end.y - start.y)
    }

    var tailLength: CGFloat {
        length - headLength
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            path.addLines([
                .init(x: 0, y: tailWidth / 2),
                .init(x: tailLength, y: tailWidth / 2),
                .init(x: tailLength, y: headWidth / 2),
                .init(x: length, y: 0),
                .init(x: tailLength, y: -headWidth / 2),
                .init(x: tailLength, y: -tailWidth / 2),
                .init(x: 0, y: -tailWidth / 2)
            ])
            path.closeSubpath()
        }
    }
}
