//
//  TabViewExample.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.06.2022.
//

import SwiftUI

enum TabEnum {
    case home
    case profile
    case settings
}

struct TabViewExample: View {
    
    @State var tabPage: TabEnum = .home
    
    var body: some View {
        TabView(selection: $tabPage) {
            
            Text("Hello, World!")
                .background(Color.blue)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            BackToRootExample()
                .tabItem {
                    Label("Profile", systemImage: "star")
                }
            
            Text("Hello, World!")
                .background(Color.yellow)
                .tabItem {
                    Label("Settings", systemImage: "timelapse")
                }
        }
    }
}

#if DEBUG
struct TabViewExample_Previews: PreviewProvider {
    static var previews: some View {
        TabViewExample()
    }
}
#endif
