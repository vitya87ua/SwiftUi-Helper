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
            HStack {
                Button {
                    
                } label: {
                    HStack(spacing: 18) {
                        Text("main2").font(.system(size: 18)).bold()
                        Image("group").font(.system(size: 26))
                    }
                    .foregroundColor(.black)
                    .frame(width: 151, height: 62)
                    .background(Color.lightGray)
                    .cornerRadius(18)
                }
                
                Button {
                    
                } label: {
                    HStack(spacing: 18) {
                        Text("journal2").font(.system(size: 18)).bold()
                        Image("writing").font(.system(size: 26))
                    }
                    .foregroundColor(.black)
                    .frame(width: 151, height: 62)
                    .background(Color.lightGray)
                    .cornerRadius(18)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.red, lineWidth: 3)
                    )
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
