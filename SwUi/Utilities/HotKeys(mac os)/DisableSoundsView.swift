//
//  DisableSoundsView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 28.07.2022.
//


// MARK: - Usage
/*
 struct MyView: View {
     var body: some View {
         Text("Hello")
     }
         .addHotKeys(
             [HotkeyCombination(
                 keyBase: [],
                 key: .kVK_Delete,
                 action: deleteAction)]
         )
     
     private func deleteAction() {
         // to do...
     }
 }
 */

#if canImport(AppKit)
import SwiftUI

struct DisableSoundsView: NSViewRepresentable {
    var hotkeys: [HotkeyCombination]
    
    func makeNSView(context: Context) -> NSView {
        let view = DisableSoundsNSView()
        
        view.hotkeys = hotkeys
        
        return view
    }
    
    func updateNSView(_ nsView: NSView, context: Context) { }
}

class DisableSoundsNSView: NSView {
    var hotkeys: [HotkeyCombination] = []
    
    override func performKeyEquivalent(with event: NSEvent) -> Bool {
        return hotkeysSubscription(combinations: hotkeys)
    }
}

fileprivate func hotkeysSubscription(combinations: [HotkeyCombination]) -> Bool {
    for comb in combinations {
        let basePressedCorrectly = comb.keyBasePressed
        
        if basePressedCorrectly && comb.key.isPressed {
            comb.action()
            return true
        }
    }
    
    return false
}
#endif
