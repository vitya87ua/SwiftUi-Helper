//
//  Extension+UIImage.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 18.11.2022.
//

import UIKit

extension UIImage {
    
    struct OverlayEntity {
        let image: UIImage
        let frame: CGRect
    }
    
    func overlay(imageEntity entity: OverlayEntity) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
        draw(in: CGRect(origin: .zero, size: size))
        entity.image.draw(in: entity.frame)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func overlay(imageEntities entities: [OverlayEntity]) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
        draw(in: CGRect(origin: .zero, size: size))
        entities.forEach {
            $0.image.draw(in: $0.frame)
        }
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

