//
//  TEMP.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 01.09.2021.
//

import SwiftUI

struct NewUser: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var age: Int
}

final class ViewModel: ObservableObject {
    @Published var confIsPres: Bool = false
    
    @Published var users: [NewUser] = [
        NewUser(name: "Ol", age: 12),
        NewUser(name: "Lor", age: 22),
        NewUser(name: "Asr", age: 32),
        NewUser(name: "Oin", age: 42),
        NewUser(name: "Plm", age: 6)
    ]
}

struct TEMP: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    @State var sel: String = "Hello"
    @State var num: Int = 0
    @State var isPresented: Bool = false
    
    @GestureState var gestState: CGSize = .zero
    
    @Namespace var namespace
    
    var body: some View {
        VStack {
            List {
                ForEach($viewModel.users) { $user in
                    TextField("\(user.age)", value: $user.age, format: .number)
                }
                
                Text("Color: " + (Color.blue.hex ?? "f"))
            }
            
            List {
                ForEach(viewModel.users) { user in
                    Text(user.name + " \(user.age)")
                }
            }
        }
    }
}

#if DEBUG
    struct TEMP_Previews: PreviewProvider {
        static var previews: some View {
            TEMP()
        }
    }
#endif
