//
//  Rectangle3DButtonStyle.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 08.02.2022.
//

import SwiftUI

struct Rectangle3DButtonStyle: ButtonStyle {
    
    var textColor: Color
    var btnColor: Color
    
    init(textColor: Color = .black, btnColor: Color = .yellow) {
        self.textColor = textColor
        self.btnColor = btnColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: BtnConstant.cornerRadius)
                .fill(Color.black.opacity(0.2))
                .frame(height: BtnConstant.btnHeight)
                .frame(maxWidth: .infinity)
                .offset(x: 0, y: configuration.isPressed ? 0 : 12)
                .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
            
            RoundedRectangle(cornerRadius: BtnConstant.cornerRadius)
                .stroke(lineWidth: BtnConstant.lineWidth)
                .background(btnColor)
                .frame(height: BtnConstant.btnHeight)
                .frame(maxWidth: .infinity)
            
            RoundedRectangle(cornerRadius: BtnConstant.cornerRadius)
                .stroke(lineWidth: BtnConstant.lineWidth)
                .background(Color.black.opacity(0.35))
                .frame(height: BtnConstant.btnHeight)
                .frame(maxWidth: .infinity)
            
            configuration.label
                .font(.staatlichesRegular(size: 32))
                .frame(height: BtnConstant.btnHeight)
                .frame(maxWidth: .infinity)
                .background(btnColor)
                .foregroundColor(textColor)
                .cornerRadius(BtnConstant.cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: BtnConstant.cornerRadius)
                        .stroke(lineWidth: BtnConstant.lineWidth)
                )
                .offset(x: configuration.isPressed ? 0 : 13, y: 0)
                .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
        }
    }
    
    private struct BtnConstant {
        static let btnHeight: CGFloat = 58
        static let cornerRadius: CGFloat = 4
        static let lineWidth: CGFloat = 2
    }
}

#if DEBUG
struct Rectangle3DButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center, spacing: 20) {
            Button("Label") {}
            .buttonStyle(Rectangle3DButtonStyle())
            
            Button("Label") {}
            .buttonStyle(Rectangle3DButtonStyle(btnColor: .blue))
            
            Button("Label") {}
            .buttonStyle(Rectangle3DButtonStyle(textColor: .white, btnColor: .purple))
            .frame(width: 200)
        }
        .padding(.horizontal, 30)
    }
}
#endif
