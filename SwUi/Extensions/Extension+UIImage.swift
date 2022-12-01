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
        UIGraphicsBeginImageContext(self.size)
        draw(in: CGRect(origin: .zero, size: size))
        entity.image.draw(in: entity.frame)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func overlay(imageEntities entities: [OverlayEntity]) -> UIImage? {
        UIGraphicsBeginImageContext(self.size)
        draw(in: CGRect(origin: .zero, size: size))
        entities.forEach {
            $0.image.draw(in: $0.frame)
        }
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    @discardableResult
    func write(
        to url: URL,
        options: Data.WritingOptions = .atomic
    ) -> Bool {
        let data = self.jpegData(compressionQuality: 0.7)
        
        do {
            try data?.write(to: url, options: options)
            return true
        } catch {
            Log("‼️Error: \(error) (\(error.localizedDescription)")
            return false
        }
    }
}

