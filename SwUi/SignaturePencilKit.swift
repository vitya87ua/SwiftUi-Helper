//
//  SignaturePencilKit.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 01.09.2021.
//

import SwiftUI
import PencilKit

struct SignaturePencilKit: View {

    @State var canvas = PKCanvasView()

    var body: some View {
        NavigationView {
            VStack {
                DravingView(canvas: $canvas)
                .navigationTitle("Draving")
                    .navigationBarTitleDisplayMode(.inline)

                Text("DEL")
                    .onTapGesture {
                        resetSign()
                    }
            }
            .frame(width: 300, height: 300, alignment: .center)

        }
    }

    func saveSignature() {
        let image = canvas.drawing.image(from: canvas.bounds, scale: 1)
        if let pngRepresentation = image.pngData() {
            UserDefaults.standard.set(pngRepresentation, forKey: "signature")
        }
    }

    func resetSign() {
        canvas.drawing.strokes.removeAll()
        UserDefaults.standard.removeObject(forKey: "signature")
    }

}

struct DravingView : UIViewRepresentable {

    @Binding var canvas: PKCanvasView

    func makeUIView(context: Context) -> PKCanvasView {
        canvas.drawingPolicy = .anyInput
        canvas.layer.cornerRadius = 10
        canvas.layer.borderWidth = 1
        canvas.layer.borderColor = UIColor.systemGray2.cgColor
        return canvas
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) { }
}

struct SignaturePencilKit_Previews: PreviewProvider {
    static var previews: some View {
        SignaturePencilKit()
    }
}
