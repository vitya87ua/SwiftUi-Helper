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

    var body: some View {
        VStack {
            Text("fsgsgs")

            Text(tesss)

            SmallTEMP(str: "Joe") { res in
                pr(text: res)
            }

            SmallTEMP(str: "Body") { res in
                pr(text: res)
            }

            Circle()
                .fill(LinearGradient(colors: [Color.green, .red], startPoint: .top, endPoint: .bottom))

            ZStack {
                Color.red
                Circle()
                    .fill(.green)
                    .frame(width: 200, height: 200)
                Text("fsgsgs")
            }
            .clipShape(Circle())

        }
    }

    func pr(text: String) {
        tesss = text
    }
}

struct SmallTEMP: View {

    let str: String
    let act: (String) -> Void

    var body: some View {
        Text(str)
            .onTapGesture {
                act(str + "Hello")
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
