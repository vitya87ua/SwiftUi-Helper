//
//  Extension+Font.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 25.11.2021.
//

import Foundation
import SwiftUI

extension Font {
    static func neueMontrealBold(size: CGFloat) -> Font {
        return Font.custom("NeueMontreal-Bold", size: size)
    }
    
    static func neueMontrealRegular(size: CGFloat) -> Font {
        return Font.custom("NeueMontreal-Regular", size: size)
    }
    
    static func poppinsBold(size: CGFloat) -> Font {
        return Font.custom("Poppins-Bold", size: size)
    }
    
    static func poppinsRegular(size: CGFloat) -> Font {
        return Font.custom("Poppins-Regular", size: size)
    }
    
    static func robotoRegular(size: CGFloat) -> Font {
        return Font.custom("Roboto-Regular", size: size)
    }
    
    static func robotoRegular1(size: CGFloat) -> Font {
        return Font.custom("roboto-regular", size: size)
    }
}
