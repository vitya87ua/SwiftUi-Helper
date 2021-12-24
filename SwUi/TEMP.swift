//
//  TEMP.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 01.09.2021.
//

import SwiftUI

class Model: ObservableObject {
    @Published var textOb: String = "firstText"
}

struct TEMP: View {

    @State var tesss = ""
    
    let columns = [
        GridItem(.fixed(100), spacing: 10, alignment: .center),
        GridItem(.fixed(100), spacing: 10, alignment: .center),
        GridItem(.fixed(100), spacing: 10, alignment: .center)
    ]

    var body: some View {
        VStack {
            Text("Hello")
            
            Image("soundcloud-icon-dark-grey")
                .renderingMode(.template)
                .resizable()
                .frame(width: 200, height: 200)
            
            Image(uiImage: UIImage.animatedImageNamed("soundcloud-icon-dark-grey", duration: 1) ?? UIImage())
                .renderingMode(.template)
                .resizable()
                .frame(width: 200, height: 200)
            
            LazyVGrid(columns: columns, alignment: .center, spacing: 30) {
                ForEach(0..<6, id: \.self) { item in
                    Text("Hello \(item)")
                }
            }
        }
    }
}

#if DEBUG
struct TEMP_Previews: PreviewProvider {
    static var previews: some View {
        TEMP()
    }
}
#endif
