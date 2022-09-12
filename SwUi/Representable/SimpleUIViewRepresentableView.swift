//
//  SimpleUIViewRepresentableView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 12.09.2022.
//

import SwiftUI

struct SimpleUIViewRepresentable: UIViewRepresentable {
    
    var color: Color
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(color)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) { }
    
    // Modifier
    func changeColor(_ color: Color) -> SimpleUIViewRepresentable {
        var view = self
        view.color = color
        return view
    }
}

struct SimpleUIViewRepresentableView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            
            SimpleUIViewRepresentable(color: .red)
                .equalFrame(100)
            
            SimpleUIViewRepresentable(color: .red)
                .changeColor(.blue)
                .equalFrame(100)
        }
    }
}

#if DEBUG
struct SimpleUIViewRepresentableView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleUIViewRepresentableView()
    }
}
#endif
