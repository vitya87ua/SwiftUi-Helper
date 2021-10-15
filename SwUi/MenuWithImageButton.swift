//
//  MenuWithImageButton.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 30.08.2021.
//

import SwiftUI

struct MenuWithImageButton: View {
    var body: some View {
        VStack {
            Text("Hello, World!")

            Menu("MenuWithImageButton") {
                Button(action: {
                    // Action
                }) {
                    Label("Save", systemImage: "square.and.arrow.up")
                }

                Button(action: {
                    // Action 2
                }) {
                    Label("Load", systemImage: "square.and.arrow.down")
                }

                Button(action: {
                    // Action 3
                }) {
                    Label("Clear", systemImage: "trash")
                }
            }
        }
    }
}

struct MyView: View {
    var body: some View {
        HStack {
            Text("Text")
            Image(systemName: "plus")
        }
    }
}


struct MenuWithImageButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuWithImageButton()
    }
}
