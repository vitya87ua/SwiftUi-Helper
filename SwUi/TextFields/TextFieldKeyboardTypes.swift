//
//  TextFieldKeyboardTypes.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 03.03.2022.
//

import SwiftUI

struct TextFieldKeyboardTypes: View {
    
    @State var text: String = ""
    
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack {
                Group {
                    TextField("asciiCapable-done", text: $text)
                        .keyboardType(.asciiCapable)
                        .submitLabel(.done)
                    
                    TextField("numbersAndPunctuation-go", text: $text)
                        .keyboardType(.numbersAndPunctuation)
                        .submitLabel(.go)
                    
                    TextField("URL-join", text: $text)
                        .keyboardType(.URL)
                        .submitLabel(.join)
                    
                    TextField("numberPad-next", text: $text)
                        .keyboardType(.numberPad)
                        .submitLabel(.next)
                    
                    TextField("phonePad-return", text: $text)
                        .keyboardType(.phonePad)
                        .submitLabel(.return)
                }
                
                Group {
                    TextField("namePhonePad-route", text: $text)
                        .keyboardType(.namePhonePad)
                        .submitLabel(.route)
                    
                    TextField("emailAddress-search", text: $text)
                        .keyboardType(.emailAddress)
                        .submitLabel(.search)
                    
                    TextField("decimalPad-send", text: $text)
                        .keyboardType(.decimalPad)
                        .submitLabel(.send)
                    
                    TextField("twitter-continue", text: $text)
                        .keyboardType(.twitter)
                        .submitLabel(.continue)
                    
                    TextField("webSearch-webSearch", text: $text)
                        .keyboardType(.webSearch)
                    
                    TextField("asciiCapableNumberPad", text: $text)
                        .keyboardType(.asciiCapableNumberPad)
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

struct TextFieldKeyboardTypes_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldKeyboardTypes()
    }
}
