//
//  Fields.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 28.10.2022.
//

import SwiftUI

struct SomeModel: Identifiable {
    let id: String = UUID().uuidString
    var text: String
}

struct Fields: View {
    
    @State var names: [SomeModel] = [] {
        didSet {
           Log(names)
        }
    }
    
    var body: some View {
        VStack {
            List {
                ForEach($names, id: \.id) { $name in
                    TextField("", text: $name.text)
                        .textFieldStyle(.roundedBorder)
                }
            }
            .listStyle(.insetGrouped)
            
            Button("PRINT") {
                names.forEach { Log($0) }
            }
        }
        .onAppear {
            for i in 0...30 {
                names.append(SomeModel(text: "Hello \(i)"))
            }
        }
    }
}

#if DEBUG
struct Fields_Previews: PreviewProvider {
    static var previews: some View {
        Fields()
    }
}
#endif
