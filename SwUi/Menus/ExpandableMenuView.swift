//
//  ExpandableMenuView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 09.02.2022.
//

import SwiftUI

struct ExpandableMenuView: View {

    let image: String
    let title: String
    let items: [String]

    @State var isExpanded: Bool = false
    @Binding var isSelected: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 14) {
                        Image(image)
                            .padding(.leading, 24)

                        Text(title)
                            .font(.custom("Poppins-Medium", size: 14))

                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(isExpanded ? Color.blue : .white)
                    .foregroundColor(isExpanded ? .white : .black)
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }

                if isExpanded {
                    ForEach(items, id: \.self) { item in
                        HStack(spacing: 14) {
                            Text(item)
                                .padding(.leading, 24)
                                .font(.custom("Poppins-Medium", size: 14))

                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(isSelected == item ? Color.lightGray : .white)
                        .foregroundColor(.black)
                        .onTapGesture {
                            withAnimation {
                                isSelected = item
                            }
                        }
                        
                        Divider()
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ExpandableMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.yellow

            VStack {
                ExpandableMenuView(
                    image: "group",
                    title: "Hello",
                    items: ["One", "Two", "Three"],
                    isSelected: .constant(""))
            }
        }
    }
}
#endif
