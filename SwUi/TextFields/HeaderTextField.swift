//
//  HeaderTextField.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 29.10.2021.
//

import SwiftUI

struct HeaderTextField: View {
    
    let header: String
    let placeholder: String?
    
    @Binding var text: String
    
    init(header: String, placeholder: String? = nil, text: Binding<String>) {
        self.header = header
        self.placeholder = placeholder
        self._text = text
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(header)
                .font(.caption)
                .foregroundColor(.gray)
            TextField(placeholder ?? header, text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

#if DEBUG
struct HeaderTextField_Previews: PreviewProvider {
    static var previews: some View {
        HeaderTextField(header: "Header", text: .constant("Text"))
    }
}
#endif
