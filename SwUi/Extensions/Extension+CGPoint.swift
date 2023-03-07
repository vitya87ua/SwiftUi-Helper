//
//  Extension+CGPoint.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 07.09.2022.
//

import UIKit

extension CGPoint {
    static func equalPoint(_ point: CGFloat) -> CGPoint {
        CGPoint(x: point, y: point)
    }
    
    /// Length between two points (hypotenuse)
    func length(to point: CGPoint) -> CGFloat {
        CoreGraphics.hypot(self.x - point.x, self.y - point.y)
    }
    
    /// Calculate angle between two points, 15:00 is 0°, after counterclockwise.
    /// CGPoint(x: 50, y: 50).angle(to: CGPoint(x: 150, y: 150)) -> (radians 0.7853981633974483, degrees 45)
    func angle(to comparisonPoint: CGPoint) -> (radians: CGFloat, degrees: CGFloat) {
        let center: CGPoint = CGPoint(
            x: comparisonPoint.x - self.x,
            y: comparisonPoint.y - self.y
        )
        let radians: CGFloat = atan2(center.y, center.x)
        let degrees: CGFloat = radians * 180 / .pi
        return (radians, degrees)
    }
}

// Can compare points >, <, min(CGPoint(x: 50, y: 50), CGPoint(x: 30, y: 150))
extension CGPoint: Comparable {
    public static func < (lhs: CGPoint, rhs: CGPoint) -> Bool {
        lhs.x < rhs.x && lhs.y < rhs.y
    }
}
