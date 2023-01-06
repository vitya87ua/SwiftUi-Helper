//
//  Extension+CGRect.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.01.2023.
//

import Foundation

extension CGRect {
    
    // Create CGRect with size and place this rectangle center on center coordinates.
    init(center: CGPoint, size: CGSize) {
        self.init(
            origin: CGPoint(
                x: center.x - size.center.width,
                y: center.y - size.center.height),
            size: size)
    }
    
    // Create CGRect from points and place this rectangle on its original coordinates.
    init(points: [CGPoint]) {
        if points.isEmpty {
            self.init(origin: .zero, size: .zero)
        } else {
            let minX: CGFloat = points.sorted { $0.x < $1.x }.first!.x
            let minY: CGFloat = points.sorted { $0.y < $1.y }.first!.y
            
            let maxWidth: CGFloat = points.sorted { $0.x > $1.x }.first!.x
            let maxHeight: CGFloat = points.sorted { $0.y > $1.y }.first!.y
            
            self.init(
                origin: .init(x: minX, y: minY),
                size: CGSize(width: maxWidth - minX, height: maxHeight - minY)
            )
        }
    }
    
    // Create CGRect from rects and place this rectangle on its original coordinates.
    init(rects: [CGRect]) {
        if rects.isEmpty {
            self.init(origin: .zero, size: .zero)
        } else {
            let startPoints = rects.map { $0.origin }
            let endPoints = rects.map { CGPoint(x: $0.maxX, y: $0.maxY) }

            self.init(points: startPoints + endPoints)
        }
    }
    
    /// Create CGRect from two points
    init(startPoint: CGPoint, endPoint: CGPoint) {
        let width = abs(startPoint.x - endPoint.x)
        let height = abs(startPoint.y - endPoint.y)
        
        self.init(
            origin: startPoint,
            size: CGSize(width: width, height: height)
        )
    }
    
    var center: CGPoint {
        CGPoint(x: origin.x + size.center.width, y: origin.y + size.center.height)
    }
    
    func padding(_ padding: CGFloat = 75) -> CGRect {
        let half: CGFloat = padding / 2
        
        return CGRect(
            x: self.origin.x - half,
            y: self.origin.y - half,
            width: self.width + padding,
            height: self.height + padding
        )
    }
    
    /// Function compare size of rectangles
    /// - Parameters:
    ///   - than: another comparable rectangle
    /// - Returns: Func return tuple (top: CGFloat, bottom: CGFloat, leading: CGFloat, trailing: CGFloat), with amount of how much side is bigger. If side is NOT bigger value is 0.
    func bigger(than rect: CGRect) -> (top: CGFloat, bottom: CGFloat, leading: CGFloat, trailing: CGFloat) {
        var result: (top: CGFloat, bottom: CGFloat, leading: CGFloat, trailing: CGFloat) = (0, 0, 0, 0)
        
        if rect.origin.y > self.origin.y {
            result.top = abs(rect.origin.y - self.origin.y)
        }
        
        if rect.maxY < self.maxY {
            result.bottom = abs(rect.maxY - self.maxY)
        }
        
        if rect.origin.x > self.origin.x {
            result.leading = abs(rect.origin.x - self.origin.x)
        }
        
        if rect.maxX < self.maxX {
            result.trailing = abs(rect.maxX - self.maxX)
        }
        
        return result
    }
    
    func scaleToFit(to rect: CGRect) -> CGRect {
        var result: CGRect = .zero
        
        let parentSize: CGSize = self.size
        let childSize: CGSize = rect.size
        
        // Get the aspect ratios in case we need to expand or shrink to fit
        var parentAspectRatio: CGFloat = parentSize.width / parentSize.height
        var childAspectRatio: CGFloat = childSize.width / childSize.height
        
        // No need to adjust the size if current size is square
        var adjustedSize: CGSize = childSize
        
        // Get the larger aspect ratio of the two
        // If aspect ratio is 1 then no adjustment needed
        if parentAspectRatio > childAspectRatio {
            adjustedSize.height = childSize.width / parentAspectRatio
        } else if parentAspectRatio < childAspectRatio {
            adjustedSize.width = childSize.height * parentAspectRatio
        }
        
        result = CGRect(center: self.center, size: adjustedSize)
        
        return result
    }
}

