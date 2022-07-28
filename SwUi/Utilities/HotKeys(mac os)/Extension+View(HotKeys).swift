//
//  Extension+View(HotKeys).swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 28.07.2022.
//

#if canImport(AppKit)
import SwiftUI

extension View {
    func addHotKeys(_ hotkeys: [HotkeyCombination]) -> some View {
        self.modifier(HotKeysModifier(hotkeys))
    }
}
#endif
