//
//  ETDropDownMenuView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 27.03.2022.
//

import SwiftUI

struct ETDropDownMenuModel: LabelProtocol {
    let id: Int
    let name: String
    
    var label: String {
        name
    }
    
    static var mock: ETDropDownMenuModel {
        ETDropDownMenuModel(id: 1, name: "One")
    }
    
    static var mockArray: [ETDropDownMenuModel] {[
        ETDropDownMenuModel(id: 1, name: "One"),
        ETDropDownMenuModel(id: 2, name: "Two"),
        ETDropDownMenuModel(id: 3, name: "Three")
    ]}
}

protocol LabelProtocol: Hashable {
    associatedtype ItemID: Hashable
    
    var id: ItemID { get }
    var label: String { get }
}

struct ETDropDownMenuView<T: LabelProtocol>: View {
    
    let label: String?
    @Binding var selected: T?
    let menuItems: [T]
    
    init(_ label: String? = nil, selected: Binding<T?>, menuItems: [T]) {
        self.label = label
        self._selected = selected
        self.menuItems = menuItems
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let label = label {
                Text(label)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.gray)
            }
            
            Menu {
                ForEach(menuItems, id: \.id) { item in
                    Button(item.label) {
                        selected = item
                    }
                }
            } label: {
                HStack {
                    Text(selected?.label ?? "")
                        .font(.poppinsRegular(size: 14))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Image("Polygon")
                        .resizable()
                        .frame(width: 10, height: 6)
                        .foregroundColor(Color(hex: "#D3D8DD"))
                        .padding(.trailing, 4)
                }
            }
            .padding(.top, 3)
            
            Divider()
                .background(Color(hex: "#D3D8DD"))
                .padding(.top, 5)
            
        }
    }
}

#if DEBUG
struct ETDropDownMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ETDropDownMenuView(
            "Service*",
            selected: .constant(ETDropDownMenuModel.mock),
            menuItems: ETDropDownMenuModel.mockArray
        )
        .frame(width: 200, height: 200)
    }
}
#endif
