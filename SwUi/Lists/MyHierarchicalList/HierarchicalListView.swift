//
//  HierarchicalListView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 05.02.2022.
//

import SwiftUI

struct HierarchicalListView: View {

    @ObservedObject var viewModel: HierarchicalListViewModel = HierarchicalListViewModel()

    var body: some View {
        List {
            Button("Add service") { viewModel.addService(name: "MyC \(Date())") }

            ForEach(Array(viewModel.newList.enumerated()), id: \.offset) { toService, services in
                DisclosureGroup {
                    Button("Add category") { viewModel.addCat(toServive: toService, name: "MyC \(Date())") }

                    ForEach(Array(services.children.enumerated()), id: \.offset) { toCategory, category in
                        DisclosureGroup {

                            Button("Add subcategory") {
                                viewModel.addSubCat(toServive: toService, toCategory: toCategory, name: "MySC \(Date())")
                            }

                            ForEach(category.children) { subCategory in
                                Text(String(subCategory.name))
                            }
                        } label: {
                            Text(category.name)
                        }
                    }
                } label: {
                    Text(services.name)
                }
            }
        }
    }
}

#if DEBUG
struct HierarchicalListView_Previews: PreviewProvider {
    static var previews: some View {
        HierarchicalListView()
    }
}
#endif
