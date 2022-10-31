//
//  TEMP.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 01.09.2021.
//

import SwiftUI

struct NewUser: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var age: Int
}

final class ViewModel: ObservableObject {
    @Published var confIsPres: Bool = false
    
    @Published var users: [NewUser] = [
        NewUser(name: "Ol", age: 12),
        NewUser(name: "Lor", age: 22),
        NewUser(name: "Asr", age: 32),
        NewUser(name: "Oin", age: 42),
        NewUser(name: "Plm", age: 6)
    ]
}

struct TEMP: View {
    
    let text = "Text 2: This is the expandable/collapsable text. xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    
    let text2 = "Text 2: This is the expandable/collapsable text. xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    
    @State private var lineLimit: Int = 2
    @State private var expanded: Bool = true
    @State private var height: CGFloat = 200
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Text1: This Textline is supposed to stay where it is.")

            Text(text)
                .multilineTextAlignment(.leading)
//                .lineLimit(expanded ? 10 : 2)
                .foregroundColor(.black)

//                .frame(alignment: .top)
                .frame(height: height, alignment: .top)

                .onTapGesture {
                    withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 1)) {
                        self.expanded.toggle()

                        if expanded {
                            height = 200
                        } else {
                            height = 50
                        }

//                        if lineLimit == 2 {
//                            lineLimit = 10
//                        } else {
//                            lineLimit = 2
//                        }
                    }
                }
            //            .frame(height: 200, alignment: .top)
            // .animation(.easeOut) please don't use <- this as it was deprecated in iOS 15.0
            
            Text("Text3: This Textline is supposed to  get pushed down when the text above is being expanded and pulled up when the text above is being collapsed.")
            
            Spacer()
        }
        .padding()
        .padding(.top, 100)
        .border(Color.red, width: 1)
    }
}

#if DEBUG
    struct TEMP_Previews: PreviewProvider {
        static var previews: some View {
            TEMP()
        }
    }
#endif

struct MyViewRep: UIViewRepresentable {
    
    @Binding var backgroundColor: UIColor?
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
//        view.backgroundColor = .red
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.backgroundColor = backgroundColor
    }
}
