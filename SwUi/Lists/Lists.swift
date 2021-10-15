//
//  Lists.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 24.09.2021.
//

import SwiftUI

struct Lists: View {

    var list: [CellRow] = CellRow.defaultList

    var body: some View {
        TabView {
            defaultList
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Default")
                }
            groupedList
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Grouped")
                }
            insetList
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Inset")
                }

            insetGroupedList
                .tabItem {
                    Image(systemName: "4.square.fill")
                    Text("InsetGrouped")
                }

            plainList
                .tabItem {
                    Image(systemName: "5.square.fill")
                    Text("Plain")
                }

            sidebarList
                .tabItem {
                    Image(systemName: "6.square.fill")
                    Text("Sidebar")
                }
        }
    }

    var defaultList: some View {
        List(list) { item in
            Text(item.name)
        }
        .listStyle(DefaultListStyle())
    }

    var groupedList: some View {
        List(list) { item in
            Text(item.name)
        }
        .listStyle(GroupedListStyle())
    }

    var insetList: some View {
        List(list) { item in
            Text(item.name)
        }
        .listStyle(InsetListStyle())
    }

    var insetGroupedList: some View {
        List(list) { item in
            Text(item.name)
        }
        .listStyle(InsetGroupedListStyle())
    }

    var plainList: some View {
        List(list) { item in
            Text(item.name)
        }
        .listStyle(PlainListStyle())
    }

    var sidebarList: some View {
        List(list) { item in
            Text(item.name)
        }
        .listStyle(SidebarListStyle())
    }
}

#if DEBUG
struct Lists_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Lists()
        }
    }
}
#endif
