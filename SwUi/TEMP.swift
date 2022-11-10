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
    
    @State private var show: Bool = false
    @State private var scaleEffect: CGFloat = 0.1
    @State private var opacity: CGFloat = 1 {
        didSet {
//            if opacity == 0 {
//                show = false
//                scaleEffect = 0.1
//                opacity = 1
//            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.yellow
            
            if show {
                Image(systemName: "heart.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.red)
                    .scaleEffect(scaleEffect)
                    .opacity(opacity)
            }
            
        }.overlay(alignment: .bottom, content: {
            Button("Anim") {
                show.toggle()
                withAnimation(.easeInOut) {
                    scaleEffect = 0.5
                }
                
                withAnimation(.easeInOut.delay(0.3)) {
                    opacity = 0
//                    show = false
                }
                
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
//                    show = false
//                    scaleEffect = 0.1
//                    opacity = 1
//                }
            }
            .padding(.bottom)
        })
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
