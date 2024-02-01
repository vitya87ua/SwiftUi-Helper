//
//  Extension+UIView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 01.02.2024.
//

import UIKit

extension UIView {
    func debugBorder(color: UIColor = .red, includeSubviews: Bool = true) {
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
        
        if includeSubviews {
            self.subviews.forEach { $0.debugBorder(color: color) }
        }
    }
}
