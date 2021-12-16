//
//  WheelPicker.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 14.12.2021.
//

import SwiftUI

struct WheelPicker: View {
    
    @State var realHeight: Int = 49
    
    let list: [Int] = Array(45...98)
    
    var body: some View {
        VStack {
            Text("Hello, World! \(realHeight)")
            
            Picker("", selection: $realHeight) {
                ForEach(list, id: \.self) { item in
                    Text("\(item) inch")
                }
            }
            .pickerStyle(.wheel)
        }
    }
}

#if DEBUG
struct WheelPicker_Previews: PreviewProvider {
    static var previews: some View {
        WheelPicker()
    }
}
#endif
