//
//  IfConditionModifier.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 14.04.2022.
//

import SwiftUI

struct IfConditionModifier: View {
    
    @State var isTrue: Bool = true
    
    var body: some View {
        VStack {
            Text("Hello, World! 1")
                .ifCondition(isTrue) { $0.bold() }
            
            Text("Hello, World! 2")
                .ifCondition(isTrue) { view in
                    view
                        .bold()
                        .font(.title)
                        .foregroundColor(.yellow)
                        .padding(.leading, 20)
                }
                .foregroundColor(.red)
            
            Button("Toggle") {
                isTrue.toggle()
            }
            .buttonStyle(BorderedButtonStyle())
        }
    }
}

// Apply some modifiers if condition == true, else return self view.
extension View {
    
    @ViewBuilder
    func ifCondition<T>(_ condition: Bool, view: (Self) -> T) -> some View where T: View {
        if condition {
            view(self)
        } else {
            self
        }
    }
}

#if DEBUG
struct IfConditionModifier_Previews: PreviewProvider {
    static var previews: some View {
        IfConditionModifier()
    }
}
#endif
