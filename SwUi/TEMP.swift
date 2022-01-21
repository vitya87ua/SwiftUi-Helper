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
    @State private var currentIndex: Int = 0
    
    @Environment(\.multiplayerKey) var mult
    @Environment(\.fetcherKey) var fetch

    let columns = [
        GridItem(.fixed(100), spacing: 10, alignment: .center),
        GridItem(.fixed(100), spacing: 10, alignment: .center),
        GridItem(.fixed(100), spacing: 10, alignment: .center)
    ]

    var body: some View {
        VStack {
            Text("Hello \(mult) " + tesss)
            
            Text("fetch2 \(fetch.getMul(5))")
            
            Text("fetch3 \(fetch.getRan())")
            
            Text("fetch4 \(fetch.coun)")
            
            Text("\(5 * mult)")
            
            Button("Add 1") {
                environment(\.multiplayerKey, 2)
                tesss = String(Int.random(in: 0...100))
                fetch.incr()
            }
            
            Circle()
                .frame(width: 200, height: 200)
                
            
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(.red)
                .padding(.top, -50)
//                .clipped()
            
//            Image("soundcloud-icon-dark-grey")
//                .renderingMode(.template)
//                .resizable()
//                .frame(width: 200, height: 200)
//
//            Image(uiImage: UIImage.animatedImageNamed("soundcloud-icon-dark-grey", duration: 1) ?? UIImage())
//                .renderingMode(.template)
//                .resizable()
//                .frame(width: 200, height: 200)
//
//            LazyVGrid(columns: columns, alignment: .center, spacing: 30) {
//                ForEach(0..<6, id: \.self) { item in
//                    Text("Hello \(item)")
//                }
//            }
            
            TabView(selection: $currentIndex) {
                Circle()
                    .frame(width: 200, height: 200)
                    .tag(0)
                Circle()
                    .frame(width: 200, height: 200)
                    .tag(1)
                Circle()
                    .frame(width: 200, height: 200)
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            HStack(spacing: 10) {
                ForEach(0..<3) { index in
                    Circle()
                        .frame(width: 12, height: 12)
                        .foregroundColor(Color(hex: "#FFEE50"))
                        .opacity(index == currentIndex ? 1 : 0.5)
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
