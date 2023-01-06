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
    
    var center: CGSize {
        CGSize(width: width / 2, height: height / 2)
    }
    
    func scaleToFit(to targetSize: CGSize) -> CGSize {
        var result: CGSize = .zero
        
        let parentSize: CGSize = self
        let childSize: CGSize = targetSize
        
        // Get the aspect ratios in case we need to expand or shrink to fit
        let parentAspectRatio: CGFloat = parentSize.width / parentSize.height
        let childAspectRatio: CGFloat = childSize.width / childSize.height
        
        // No need to adjust the size if current size is square
        result = childSize
        
        // Get the larger aspect ratio of the two
        // If aspect ratio is 1 then no adjustment needed
        if parentAspectRatio > childAspectRatio {
            result.height = childSize.width / parentAspectRatio
        } else if parentAspectRatio < childAspectRatio {
            result.width = childSize.height * parentAspectRatio
        }
        
        return result
    }
}
