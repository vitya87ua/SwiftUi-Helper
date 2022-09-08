//
//  Extension+CGSize.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 07.09.2022.
//

import UIKit

extension CGSize {
    static func equalSize(_ size: CGFloat) -> CGSize {
        CGSize(width: size, height: size)
    }
}
