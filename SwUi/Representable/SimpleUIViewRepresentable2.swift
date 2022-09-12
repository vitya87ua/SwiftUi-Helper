//
//  SimpleUIViewRepresentable2.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 12.09.2022.
//

import SwiftUI

struct SimpleUIViewRepresentable2: UIViewRepresentable {
    
    @Binding var color: Color
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(color)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.backgroundColor = UIColor(color)
    }
}

struct SimpleUIViewRepresentableView2: View {
    
    @State var color: Color = .red
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            
            SimpleUIViewRepresentable2(color: $color)
                .equalFrame(100)
            
            SimpleUIViewRepresentable2(color: .constant(.blue))
                .equalFrame(100)
            
            Button("Change color") {
                color = .green
            }
        }
    }
}

#if DEBUG
struct SimpleUIViewRepresentable2_Previews: PreviewProvider {
    static var previews: some View {
        SimpleUIViewRepresentableView2()
    }
}
#endif
