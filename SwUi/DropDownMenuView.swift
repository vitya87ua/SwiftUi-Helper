//
//  DropDownMenuView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 07.02.2022.
//

import SwiftUI

/// For comform enum under DropDownMenuProtocol enum must have Raw Values, like this "enum SortBy: String, DropDownMenuProtocol"
protocol DropDownMenuProtocol: CaseIterable & RawRepresentable where Self.RawValue == String {
    static var allRawCases: [String] { get }
}

enum SortBy: String, DropDownMenuProtocol {
    
    case older = "older"
    case newest = "newest"
    case acs = "acs"
    case desc = "desc"
    
    static var allRawCases: [String] {
        allCases.map { $0.rawValue }
    }
}

struct DropDownMenuView<T: DropDownMenuProtocol>: View {

    let title: String
    @Binding var selectedItem: T
    
    init(title: String, selectedItem: Binding<T>) {
        self.title = title
        self._selectedItem = selectedItem
    }
    
    var body: some View {
        Menu {
            ForEach(T.allRawCases, id: \.self) { item in
                Button {
                    if let data = T(rawValue: item) {
                        selectedItem = data
                    }
                } label: {
                    Text(item)
                }
            }
        } label: {
            Label {
                HStack(alignment: .center, spacing: 5) {
                    Text(title)
                        .foregroundColor(Color.gray)
                    
                    Text(selectedItem.rawValue)
                        .foregroundColor(Color.blue)
                    
                    Text("  \(Image("arrow_down"))")
                }
                .font(.custom("Poppins", size: 12))
            } icon: {
                
            }
        }
    }
}

#if DEBUG
struct DropDownMenuView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownMenuView<SortBy>(
            title: "Sort by: ",
            selectedItem: .constant(.acs)
        )
    }
}
#endif
