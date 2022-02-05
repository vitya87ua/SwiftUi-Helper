//
//  AppleHierarchicalListView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 05.02.2022.
//

import SwiftUI

struct AppleHierarchicalListView: View {

    @ObservedObject var viewModel: AppleHierarchicalListViewModel = AppleHierarchicalListViewModel()

    var body: some View {
        VStack{
            Button("Add") {
                viewModel.add()
            }

            List(viewModel.fileHierarchyData, children: \.children) { item in
                Text(item.description)
            }
        }
    }
}

#if DEBUG
struct AppleHierarchicalListView_Previews: PreviewProvider {
    static var previews: some View {
        AppleHierarchicalListView()
    }
}
#endif
