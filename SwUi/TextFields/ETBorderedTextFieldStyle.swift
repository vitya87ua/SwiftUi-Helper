//
//  ETBorderedTextFieldStyle.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 29.03.2022.
//

import SwiftUI

struct ETBorderedTextFieldStyle: TextFieldStyle {
    
    let title: String?
    
    init(title: String? = nil) {
        self.title = title
    }
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            VStack(alignment: .leading, spacing: 13) {
                if let title = title {
                    Text(title)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                ZStack {
                    Color.white
                    
                    configuration
                        .font(.poppinsRegular(size: 14))
                        .foregroundColor(.black)
                        .padding(10)
                }
                .cornerRadius(8)
                .frame(height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color(hex: "#D3D8DD"), lineWidth: 1)
                )
            }
        }
    }
}

struct ETBorderedTextFieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TextField("Hello", text: .constant("Hello2"))
                .textFieldStyle(ETBorderedTextFieldStyle())
                .frame(width: 300)
            
            TextField("Hello", text: .constant("Hello2"))
                .textFieldStyle(ETBorderedTextFieldStyle(title: "Discount name"))
                .frame(width: 300)
        }
    }
}
