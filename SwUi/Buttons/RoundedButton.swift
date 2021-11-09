//
//  RoundedButton.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 09.11.2021.
//

import SwiftUI

struct RoundedButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: 62)
                .background(Color.black)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 18))
        }
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RoundedButton(title: "Hello") {}
            RoundedButton(title: "Hello") {}
            .padding(.horizontal)
        }
    }
}
