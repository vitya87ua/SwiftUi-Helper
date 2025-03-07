//
//  OnHoverCursor.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 07.03.2025.
//

import SwiftUI

#if canImport(AppKit)
extension View {
    
    /// Change Cursor while cursor pointer hovering the view
    public func onHoverCursor(_ cursor: NSCursor) -> some View {
        if #available(macOS 13.0, *) {
            return self.onContinuousHover { phase in
                switch phase {
                case .active(_):
                    guard NSCursor.current != cursor else { return }
                    cursor.push()
                case .ended:
                    NSCursor.pop()
                }
            }
        } else {
            return self.onHover { inside in
                if inside {
                    cursor.push()
                } else {
                    NSCursor.pop()
                }
            }
        }
    }
}
#endif
