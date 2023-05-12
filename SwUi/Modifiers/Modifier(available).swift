//
//  Modifier(available).swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 12.05.2023.
//

import SwiftUI

extension View {
  /// Modify a view with a `ViewBuilder` closure.
  ///
  /// This represents a streamlining of the
  /// [`modifier`](https://developer.apple.com/documentation/swiftui/view/modifier(_:))
  /// \+ [`ViewModifier`](https://developer.apple.com/documentation/swiftui/viewmodifier)
  /// pattern.
  /// - Note: Useful only when you don't need to reuse the closure.
  /// If you do, turn the closure into an extension! ♻️
  func modifier<ModifiedContent: View>(
    @ViewBuilder body: (_ content: Self) -> ModifiedContent
  ) -> ModifiedContent {
    body(self)
  }
}

// Usage example
struct Modifier_available_: View {
    var body: some View {
        VStack {
            
            // Without
            if #available(iOS 16.0, *) {
                Text("Hello, World!")
                    .monospaced()
            } else {
                // Fallback on earlier versions
            }
            
            // With
            Text("Hello, World! With modifier")
                .modifier { view in
                    if #available(iOS 16.0, *) {
                        view
                            .monospaced()
                    } else {
                        view
                    }
                }
        }
    }
}

#if DEBUG
struct Modifier_available__Previews: PreviewProvider {
    static var previews: some View {
        Modifier_available_()
    }
}
#endif
