//
//  TextFieldFormats.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 24.03.2022.
//

import SwiftUI

struct TextFieldFormats: View {
    
    @State var text: String = ""
    
    @State var integer: Int = 435
    @State var double: Double = 435.4456400
    
    @State var rounded: Double = 435.4
    
    @State var date: Date = Date()
    
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack {
                Group {
                    TextField("", value: $integer, format: .number)
                    TextField("", value: $double, format: .currency(code: "USD"))
                    TextField("", value: $double, format: .percent)
                    
                    TextField("", value: $rounded, format: .number.rounded(rule: .down))
                    
                    TextField("", value: $date, format: .dateTime)
                }
                
                Group {
                    
                }
                
                Spacer()
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
        } else {
            // Fallback on earlier versions
        }
    }
}

#if DEBUG
struct TextFieldFormats_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldFormats()
    }
}
#endif
