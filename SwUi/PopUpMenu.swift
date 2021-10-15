//
//  PopUpMenu.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 30.08.2021.
//

import SwiftUI

struct PopUpMenu: View {
    @State var isPresented: Bool = false

    var body: some View {
        ZStack {
            Color.red
            VStack {
                Text("Hello, World!")
                    .onTapGesture {
                        self.isPresented.toggle()
                    }
                Spacer()
            }

            UpMenu(isPresented: $isPresented)
        }
    }
}

struct AddMenuModel: Identifiable {
    let id: String = UUID().uuidString
    let text: String
    let image: String
    let color: Color
}

struct UpMenu: View {
    @Binding var isPresented: Bool

    let model: [AddMenuModel] = [
        AddMenuModel(text: "Sync", image: "ic_fab_sync", color: .red),
        AddMenuModel(text: "Set Deferred", image: "ic_change_horiz", color: .gray),
        AddMenuModel(text: "Set Active", image: "ic_driver_24", color: .green),
        AddMenuModel(text: "Login Team", image: "ic_fab_driver_switch", color: .blue),
        AddMenuModel(text: "Undocking", image: "ic_fab_undocking", color: .pink),
        AddMenuModel(text: "Post", image: "ic_post_", color: .orange)
    ]

    var body: some View {
        GeometryReader { geometry in
            if isPresented {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
                    ForEach(model) { item in
                        MenuElement(item: item, isPresented: $isPresented)
                    }
                })
                .frame(width: geometry.size.width - 50)
                .background(Color.purple)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
        }
        .animation(.linear)
    }
}


struct MenuElement: View {
    let item: AddMenuModel
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Button(action: {
                isPresented = false
            }, label: {
                Circle()
                    .frame(width: 60, height: 60)
                    .overlay(Image(item.image))
                    .foregroundColor(item.color)
            })

            Text(item.text)
                .foregroundColor(.gray)
                .lineLimit(0)
                .fixedSize()
        }
        .padding()
        .background(Color.yellow)
    }
}

#if DEBUG
struct PopUpMenu_Previews: PreviewProvider {
    static var previews: some View {
        PopUpMenu()
    }
}
#endif
