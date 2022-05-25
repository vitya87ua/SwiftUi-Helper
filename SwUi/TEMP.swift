//
//  TEMP.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 01.09.2021.
//

import SwiftUI

final class ViewModel: ObservableObject {
    @Published var confIsPres: Bool = false
}

struct TEMP: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    @State var sel: String = "Hello"
    @State var num: Int = 0
    @State var isPresented: Bool = false
    
    @GestureState var gestState: CGSize = .zero
    
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            Color.scooter
            
            VStack {
                
                if viewModel.confIsPres {
                    HStack {
                        Text("Hello **\(sel)**")
                            .matchedGeometryEffect(id: "text", in: namespace)
                        Spacer()
                    }
                } else {
                    HStack {
                        Spacer()
                        Text("Hello **\(sel)**")
                            .matchedGeometryEffect(id: "text", in: namespace)
                    }
                }
                
                Button("Conf") {
                    withAnimation(.spring().speed(0.7)) {
                        viewModel.confIsPres.toggle()
                    }
                }
                .padding(.top, 50)
            }
            .padding(.horizontal)
        }
        .onSwipe { direct in
            print(#fileID, #line, "direct", direct)
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
