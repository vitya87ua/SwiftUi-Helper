//
//  HotKeysModifier.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 28.07.2022.
//

#if canImport(AppKit)
import SwiftUI
import Combine

struct HotKeysModifier: ViewModifier {
    
    @State var subs = Set<AnyCancellable>() // Cancel onDisappear
    
    var hotkeys: [HotkeyCombination]
    
    init(_ hotkeys: [HotkeyCombination]) {
        self.hotkeys = hotkeys
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            DisableSoundsView(hotkeys:hotkeys)
            content
        }
    }
}
#endif
