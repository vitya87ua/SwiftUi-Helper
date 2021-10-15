//
//  Sheet.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 08.10.2021.
//

import SwiftUI

struct Sheet: View {

    @State var sheetIsOpen: Bool = false
    @State var count: Int = 0

    var body: some View {
        ZStack {
            Color.yellow

            VStack {
                Text("One sheet \(count)")

                Button("Open Sheet") {
                    sheetIsOpen = true
                }
                .sheet(isPresented: $sheetIsOpen, onDismiss: addValue) {
                    AnotherSheet(sheetIsOpen: $sheetIsOpen, count: count)
            }
            }
        }
    }

    func addValue() {
        count += 1
    }
}

struct AnotherSheet: View {

    @Binding var sheetIsOpen: Bool
    @State var count: Int

    var body: some View {
        ZStack {
            Color.blue

            VStack {
                Text("Another sheet \(count)")

                Button("Close Sheet") {
                    sheetIsOpen = false
                }
            }
            .foregroundColor(.white)
        }
    }
}

#if DEBUG
struct Sheet_Previews: PreviewProvider {
    static var previews: some View {
        Sheet()
    }
}
#endif
