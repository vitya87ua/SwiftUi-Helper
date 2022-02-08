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
        VStack {
            HStack {
                Button("OOPEN") {
                    withAnimation {
                        viewModel.allRows(isExpanded: true)
                    }
                }
                
                Button("CLOSE") {
                    withAnimation {
                        viewModel.allRows(isExpanded: false)
                    }
                }
            }
            
            List {
                listHeaderView(title: "Services") {
                    viewModel.addService(name: "MyC \(Date())")
                }
                
                ForEach(Array(viewModel.listModel.enumerated()), id: \.offset) { serOffset, service in
                    DisclosureGroup(isExpanded: $viewModel.isExpandedService[serOffset]) {
                        listHeaderView(title: "Category") {
                            viewModel.addCat(toServive: serOffset, name: "MyC \(Date())")
                        }
                        
                        ForEach(Array(service.children.enumerated()), id: \.offset) { catOffset, category in
                            DisclosureGroup(isExpanded: $viewModel.isExpandedCategory[serOffset][catOffset]) {
                                listHeaderView(title: "Subcategory") {
                                    viewModel.addSubCat(toServive: serOffset, toCategory: catOffset, name: "MySC \(Date())")
                                }
                                
                                ForEach(category.children) { subCategory in
                                    Text(subCategory.name)
                                        .listRowBackground(Color.lightGray)
                                }
                            } label: {
                                Text(category.name)
                            }
                        }
                    } label: {
                        Text(service.name)
                    }
                }
            }
        }
    }
    
    private func listHeaderView(title: String, action: @escaping () -> Void) -> some View {
        HStack(spacing: 16) {
            Text(title)
                .foregroundColor(.gray)
            
            Button {
                action()
            } label: {
                Label("Add New", systemImage: "plus.circle.fill")
                    .foregroundColor(.green)
            }
        }
        .padding(.vertical, 10)
        .padding(.leading, 20)
    }
}

#if DEBUG
struct HierarchicalListView_Previews: PreviewProvider {
    static var previews: some View {
        HierarchicalListView()
    }
}
#endif

/*
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

 */
