//
//  ListWithSelection.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 24.09.2021.
//

import SwiftUI

struct ListWithSelection: View {

    var list: [CellRow] = CellRow.defaultList

    var body: some View {
        TabView {
            SingleSelection(list: list)
                .tabItem {
                    Image(systemName: "list.number")
                    Text("SingleSelection")
                }

            MultiSelection(list: list)
                .tabItem {
                    Image(systemName: "list.star")
                    Text("MultiSelection")
                }
        }
    }

    struct SingleSelection: View {

        let list: [CellRow]

        @State var selectedRow: CellRow?

        var body: some View {
            List(list) { item in
                RoundedRectangle(cornerRadius: 5.0)
                    .fill()
                    .foregroundColor(selectedRow == item ? Color.blue : Color.white)
                    .overlay(
                        Text(item.name)
                            .padding(.leading)
                            .foregroundColor(selectedRow == item ? .white : .black)
                        , alignment: .leading)
                    .onTapGesture {
                        selectedRow = item
                    }
            }.listStyle(GroupedListStyle())
        }
    }

    struct MultiSelection: View {

        let list: [CellRow]

        @State var selectedRow: [CellRow] = []

        var body: some View {
            List(list) { item in
                RoundedRectangle(cornerRadius: 5.0)
                    .fill()
                    .foregroundColor(selectedRow.contains(item) ? Color.green : Color.white)
                    .overlay(
                        Text(item.name)
                            .padding(.leading)
                            .foregroundColor(selectedRow.contains(item) ? .white : .black)
                        , alignment: .leading)
                    .onTapGesture {
                        if selectedRow.contains(item) {
                            selectedRow.remove(at: selectedRow.firstIndex(of: item)!)
                        } else {
                            selectedRow.append(item)
                        }
                    }
            }
        }
    }
}

#if DEBUG
struct ListWithSelection_Previews: PreviewProvider {
    static var previews: some View {
        ListWithSelection()
    }
}
#endif
