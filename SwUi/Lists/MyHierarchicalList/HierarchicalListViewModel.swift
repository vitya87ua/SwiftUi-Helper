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
    
    // Uncomment for real data
//    @Published var isExpandedService: [Bool] = []
//    @Published var isExpandedCategory: [[Bool]] = []
//
//    @Published var listModel: [ServiceRowModel] = []
//
//    init(listModel: [ServiceRowModel]) {
//        self.createIsExpanded(listFrom: listModel)
//        self.listModel = listModel
//    }
    
    
    // Mock object! Only for Preview
    @Published var isExpandedService: [Bool] = [false, false, false]
    @Published var isExpandedCategory: [[Bool]] = [[false, false, false], [false, false, false], [false, false, false]]
    @Published var listModel: [ServiceRowModel] = [
        ServiceRowModel(name: "Complete basement finishing", children: [
            CategoryRowModel(name: "5. Basement Base Price", children: [
                SubCategoryRowModel(name: "General"),
                SubCategoryRowModel(name: "Insulation and Soundproofing")
            ]),
            CategoryRowModel(name: "8. Rough-In Upgrades", children: [
                SubCategoryRowModel(name: "Design and other"),
                SubCategoryRowModel(name: "HVAC and Supplemental")
            ]),
            CategoryRowModel(name: "6. Basement Upgrades", children: [])
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
    //

    // Add Functionality
    func addService(name: String) {
        isExpandedService.append(false)
        isExpandedCategory.append([])
        listModel.append(ServiceRowModel(name: name, children: []))
    }

    func addCat(toServive serOffset: Int, name: String) {
        isExpandedCategory[serOffset].append(false)
        listModel[serOffset].children.append(CategoryRowModel(name: name, children: []))
    }

    func addSubCat(toServive serOffset: Int, toCategory catOffset: Int, name: String) {
        listModel[serOffset].children[catOffset].children.append(SubCategoryRowModel(name: name))
    }


    // Delete Functionality
    func deleteService(index: Int) {
        isExpandedService.remove(at: index)
        isExpandedCategory.remove(at: index)
        listModel.remove(at: index)
    }

    func deleteCategory(fromServive serIndex: Int, category catIndex: Int) {
        isExpandedCategory[serIndex].remove(at: catIndex)
        listModel[serIndex].children.remove(at: catIndex)
    }

    func deleteSubCategory(fromServive serIndex: Int, fromCategory catIndex: Int, subCategoryId: UUID) {
        if let index = listModel[serIndex].children[catIndex].children.firstIndex(where: { $0.id == subCategoryId }) {
            listModel[serIndex].children[catIndex].children.remove(at: index)
        }
    }


    func allRows(isExpanded expand: Bool) {
        for (section, categoties) in isExpandedCategory.enumerated() {
            for categoty in categoties.indices {
                isExpandedCategory[section][categoty] = expand
            }
        }
        
        for section in isExpandedService.indices {
            isExpandedService[section] = expand
        }
    }
    
    private func createIsExpanded(listFrom: [ServiceRowModel]) {
        let serviceResult: [Bool] = Array(repeating: false, count: listFrom.count)
        var categoryResult: [[Bool]] = []
        
        for service in listFrom {
            let category = Array(repeating: false, count: service.children.count)
            categoryResult.append(category)
        }
        isExpandedService = serviceResult
        isExpandedCategory = categoryResult
    }
}
