//
//  SmoothLineShape.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 05.08.2022.
//

import SwiftUI

struct SmoothLineShape: Shape {
    
    var points: [CGPoint]
    var smoothLine: Bool = true
    
    private var controlPoints: [SmoothLineSegmentControlPoints] {
        SmoothLineConfiguration(points: points).configuredControlPoints
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            if smoothLine {
                for i in points.indices {
                    if i == 0 {
                        path.move(to: points[i])
                    } else {
                        let segment = controlPoints[i - 1]
                        path.addCurve(
                            to: points[i],
                            control1: segment.control1,
                            control2: segment.control2
                        )
                    }
                }
            } else {
                path.addLines(points)
            }
        }
    }
}
