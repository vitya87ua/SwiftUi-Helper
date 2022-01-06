//
//  GridTabView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.01.2022.
//

import SwiftUI

struct GridTabView<T, Content: View>: View {
    
    let models: [[T]]
    let columns: [GridItem]
    let content: (T) -> Content
    
    @State private var currentIndex: Int = 0
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(Array(models.enumerated()), id: \.offset) { tabIndex, tabArray in
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(Array(tabArray.enumerated()), id: \.offset) { index, model in
                        content(model)
                    }
                }
                .tag(tabIndex)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

//#if DEBUG
//struct GridTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridTabView(models:
//                        [["A", "B", "C"], ["D", "E", "J"], ["Z", "T", "R"],
//                         ["F", "B", "C"], ["D", "F", "J"], ["Z", "L", "R"]],
//                    columns: Array(repeating:  GridItem(.fixed(104), spacing: 16), count: 3)) { item in
//            Circle()
//                .frame(width: 100, height: 100, alignment: .center)
//        }
//    }
//}
//#endif
