//
//  Applyable.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 18.08.2022.
//

import Foundation

protocol Applyable { }

extension Applyable {
        
    @discardableResult
    func apply(_ configuration: (Self) throws -> Void) rethrows -> Self {
        try configuration(self)
        
        return self
    }
}

extension NSObject: Applyable { }

// MARK: - Usage

/*
 // ex 1
 private lazy var textField = UITextField().apply {
     $0.backgroundColor = .clear
     $0.textColor = .white
     $0.textAlignment = .center
     $0.font = designSystem.gilroyFont.semiBold.font(size: 18)
 }

 // ex 2
 private lazy var textField = UITextField().apply { textField in
     textField.backgroundColor = .clear
     textField.textColor = .white
     textField.textAlignment = .center
     textField.font = designSystem.gilroyFont.semiBold.font(size: 18)
 }

 // ex 3
 UIImageView().apply { imageView in
     imageView.contentMode = .scaleAspectFit
     imageView.image = image
 }
 */

