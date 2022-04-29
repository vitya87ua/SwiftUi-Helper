//
//  Extension+View.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 19.10.2021.
//

import Foundation
import SwiftUI

//#if canImport(UIKit)
//extension View {
//    func hideKeyboard() {
//        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
//}
//#endif

extension View {
    func withoutAnimation() -> some View {
        self.animation(nil, value: UUID())
    }
}
