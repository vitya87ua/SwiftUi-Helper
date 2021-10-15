//
//  UITestToggle.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 09.10.2021.
//

import SwiftUI

struct UITestToggle: View {

    @State var isOpen: Bool = false

    var body: some View {
        VStack {
            Text(isOpen ? "ON" : "OFF")
                .accessibility(identifier: "textChangeOn")

            Toggle("My Toggle", isOn: $isOpen)
                .labelsHidden()
                .accessibility(identifier: "toggleMoveOn")
        }
    }
}

#if DEBUG
struct UITestToggle_Previews: PreviewProvider {
    static var previews: some View {
        UITestToggle()
    }
}
#endif
