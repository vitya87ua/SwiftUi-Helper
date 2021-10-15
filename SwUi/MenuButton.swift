//
//  MenuButton.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 10.09.2021.
//

import SwiftUI

struct MenuButtonModel: Identifiable {
    let id: Int
    let image: String
    let action: () -> Void
}

// Animation doesn't work on PreviewProvider
struct MenuButton: View {

    @Binding var isOpen: Bool

    let buttons: [MenuButtonModel]

    private let radius: CGFloat = 50

    var body: some View {
        ZStack {
            ForEach(buttons.indices) { item in
                button(model: buttons[item])
                    .offset(x: 0, y: isOpen ? -65 * CGFloat(item + 1) : 0)
            }

            generalButton
                .offset(x: 0, y: 0)

        }
        .animation(.linear(duration: 0.2))
    }

    private func button(model: MenuButtonModel) -> some View {
        Button {
            isOpen.toggle()
            model.action()
        } label: {
            Image(model.image)
                .renderingMode(.original)
        }
        .frame(width: radius, height: radius)
        .background(Color.yellow)
        .clipShape(Circle())
    }

    private var generalButton: some View {
        Button {
            isOpen.toggle()
        } label: {
            Image("ic_fab_sync")
                .renderingMode(.original)
                .rotationEffect(Angle(degrees: isOpen ? 45 : 0))
        }
        .frame(width: radius, height: radius)
        .background(Color.yellow)
        .clipShape(Circle())
    }
}

#if DEBUG
struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(
            isOpen: .constant(true),
            buttons: [
                MenuButtonModel(id: 1, image: "ic_fab_sync") {},
                MenuButtonModel(id: 2, image: "ic_fab_sync") {},
                MenuButtonModel(id: 3, image: "ic_fab_sync") {},
                MenuButtonModel(id: 4, image: "ic_fab_sync") {}
            ]
        )
    }
}
#endif
