//
//  StrokeText.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 04.01.2022.
//

import SwiftUI

struct StrokeText: View {
    
    let text: String
    let fontSize: CGFloat
    let kern: CGFloat
    let strokeColor: UIColor
    let strokeWidth: CGFloat
    
    init(_ text: String, fontSize: CGFloat, kern: CGFloat = 0, strokeColor: UIColor = .black, strokeWidth: CGFloat = 2) {
        self.text = text
        self.fontSize = fontSize
        self.kern = kern
        self.strokeColor = strokeColor
        self.strokeWidth = strokeWidth
    }
    
    var body: some View {
        Text(text)
            .font(.staatlichesRegular(size: fontSize))
            .kerning(kern)
            .overlay(
                StrokeTextLabel(
                    text: text,
                    fontSize: fontSize,
                    kern: kern,
                    strokeColor: strokeColor,
                    strokeWidth: strokeWidth
                )
            )
    }
}

// MARK: - Required!
struct StrokeTextLabel: UIViewRepresentable {
    
    let text: String
    let fontSize: CGFloat
    let kern: CGFloat
    let strokeColor: UIColor
    let strokeWidth: CGFloat
    
    func makeUIView(context: Context) -> UILabel {
        let attributedStringParagraphStyle = NSMutableParagraphStyle()
        attributedStringParagraphStyle.alignment = NSTextAlignment.center
        let attributedString = NSAttributedString(
            string: text,
            attributes:[
                NSAttributedString.Key.paragraphStyle: attributedStringParagraphStyle,
                NSAttributedString.Key.strokeWidth: strokeWidth,
                NSAttributedString.Key.foregroundColor: UIColor.clear,
                NSAttributedString.Key.strokeColor: strokeColor,
                NSAttributedString.Key.font: UIFont(name:"Staatliches-Regular", size: fontSize)!,
                NSAttributedString.Key.kern: kern
            ]
        )

        let strokeLabel = UILabel(frame: CGRect.zero)
        strokeLabel.attributedText = attributedString
        strokeLabel.backgroundColor = UIColor.clear
        strokeLabel.sizeToFit()
        strokeLabel.center = CGPoint.zero
        return strokeLabel
    }

    func updateUIView(_ uiView: UILabel, context: Context) {}
}

#if DEBUG
struct StrokeText_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            StrokeText("Hello world", fontSize: 66)
                .foregroundColor(.clear)
            
            StrokeText("Hello world", fontSize: 66)
                .foregroundColor(.pink)
            
            StrokeText("Hello world", fontSize: 66, kern: 1.5, strokeColor: .blue, strokeWidth: 4)
                .foregroundColor(.yellow)
        }
    }
}
#endif
