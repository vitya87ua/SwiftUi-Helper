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
}

