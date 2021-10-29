//
//  TextFields.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 13.09.2021.
//

import SwiftUI

struct TextFields: View {

    @State var myText: String = ""
    @State var toggleSwitch: Bool = false
    
    @State var amount: Double = 5
    
    var body: some View {
        VStack(spacing: 5) {
            HeaderTextField(header: "Odometer", text: $myText)
        }
        .padding(.horizontal)

//        VStack {
//            Form {
//                HStack {
//                    Text("EngineHour:")
//                        .frame(width: 100, alignment: .leading)
//                    TextField("Prev", text: $myText)
//                }
//                TextField("Prev1", text: $myText)
//                TextField("Prev2", text: $myText)
//                TextField("Prev3", text: $myText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                Toggle(isOn: $toggleSwitch, label: {
//                    Text("Label")
//                })
//                .sheet(isPresented: $toggleSwitch, content: {
//                    TextField("SheetText", text: $myText)
//                })
//            }
//
//            VStack {
//                TextField("Prev4", text: $myText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                TextField("Prev5", text: $myText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                TextField("Prev6", text: $myText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//
//            }
//            .padding(.horizontal)
//
//            Form {
//                Section(header: Text("Section 1")) {
//                    TextField("SectionPrev 1", text: $myText)
//                }
//
//                Section(header: Text("Section 2")) {
//                    TextField("SectionPrev 2", text: $myText)
//                }
//
//                Section(header: Text("Section 3")) {
//                    TextField("SectionPrev 3", text: $myText)
//                }
//            }
//
//        }
    }
}

#if DEBUG
struct TextFields_Previews: PreviewProvider {
    static var previews: some View {
        TextFields()
    }
}
#endif
