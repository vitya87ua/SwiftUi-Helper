//
//  HierarchicalListViewModel.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 05.02.2022.
//

import Foundation

struct ServiceRowModel: Hashable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var children: [CategoryRowModel]
}

struct CategoryRowModel: Hashable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var children: [SubCategoryRowModel]
}

struct SubCategoryRowModel: Hashable, Identifiable {
    var id: UUID = UUID()
    var name: String
}

final class HierarchicalListViewModel: ObservableObject {

    @Published var newList: [ServiceRowModel] = [
        ServiceRowModel(name: "Complete basement finishing", children: [
            CategoryRowModel(name: "1. Basement Base Price", children: [
                SubCategoryRowModel(name: "General"),
                SubCategoryRowModel(name: "Insulation and Soundproofing")
            ]),
            CategoryRowModel(name: "2. Basement Upgrades", children: [
                SubCategoryRowModel(name: "Design and other"),
                SubCategoryRowModel(name: "HVAC and Supplemental Heat")
            ]),
            CategoryRowModel(name: "3. Basement Rough-In", children: [])
        ]),
        ServiceRowModel(name: "Partial basement remodeling", children: [
            CategoryRowModel(name: "3. Basement Base Price", children: [
                SubCategoryRowModel(name: "General"),
                SubCategoryRowModel(name: "Insulation and Soundproofing")
            ]),
            CategoryRowModel(name: "6. Basement Rough-In Upgrades", children: [
                SubCategoryRowModel(name: "Design and other"),
                SubCategoryRowModel(name: "HVAC and Supplemental Heat")
            ])
        ]),
        ServiceRowModel(name: "New basement finishing", children: [
            CategoryRowModel(name: "5. Basement Base Price", children: [
                SubCategoryRowModel(name: "General"),
                SubCategoryRowModel(name: "Insulation and Soundproofing")
            ]),
            CategoryRowModel(name: "8. Basement Rough-In Upgrades", children: [
                SubCategoryRowModel(name: "Design and other"),
                SubCategoryRowModel(name: "HVAC and Supplemental Heat")
            ])
        ])
    ]

    func addService(name: String) {
        newList.append(ServiceRowModel(name: name, children: []))
    }

    func addCat(toServive: Int, name: String) {
        newList[toServive].children.append(CategoryRowModel(name: name, children: []))
    }

    func addSubCat(toServive: Int, toCategory: Int, name: String) {
        newList[toServive].children[toCategory].children.append(SubCategoryRowModel(name: name))
    }
}
