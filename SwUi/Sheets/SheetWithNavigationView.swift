//
//  SheetWithNavigationView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 08.10.2021.
//

import SwiftUI

struct SheetWithNavigationView: View {

    @State var sheetIsOpen: Bool = false
    @State var count: Int = 0

    var body: some View {
        NavigationView {
            ZStack {
                Color.purple

                VStack {
                    Text("One NavigationSheet \(count)")

                    Button("Open Sheet") {
                        sheetIsOpen = true
                    }
                    .sheet(isPresented: $sheetIsOpen, onDismiss: addValue) {
                        AnotherSheetWithNavigationView(sheetIsOpen: $sheetIsOpen, count: count)
                    }
                }
            }
            .navigationBarTitle("One NavigationSheet", displayMode: .automatic)
        }
    }

    func addValue() {
        count += 1
    }
}

struct AnotherSheetWithNavigationView: View {

    @Binding var sheetIsOpen: Bool
    @State var count: Int

    var body: some View {
        NavigationView {
            ZStack {
                Color.orange

                VStack {
                    Text("Another NavigationSheet \(count)")

                    Button("Close Sheet") {
                        sheetIsOpen = false
                    }
                }
            }
            .navigationBarTitle("Another NavigationSheet \(count)", displayMode: .inline)
            .navigationBarItems(
                leading:
                    Button("LeadBtn") {},
                trailing:
                    Button(action: {}, label: { Image(systemName: "car") })
            )
        }
    }
}

#if DEBUG
struct SheetWithNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SheetWithNavigationView()
    }
}
#endif
