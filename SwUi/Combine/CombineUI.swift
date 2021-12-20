//
//  CombineUI.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 05.11.2021.
//

import SwiftUI

struct CombineUI: View {

    @ObservedObject var data: CombineJSON = CombineJSON()

    var body: some View {
        VStack(spacing: 10) {
            Text("Hello, World!")
            Text(data.myText).background(Color.red)
            Text(data.repo?.name ?? "zero")
            Text(data.repo?.full_name ?? "zero")
            HStack {
                Button("UPdate") {
                    data.someF()
                }
                .foregroundColor(.red)

                Button("GetImage") {
                    data.getImage()
                }
            }

            if let image = data.myImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 400)
            }
        }
    }
}

#if DEBUG
struct CombineUI_Previews: PreviewProvider {
    static var previews: some View {
        CombineUI()
    }
}
#endif
