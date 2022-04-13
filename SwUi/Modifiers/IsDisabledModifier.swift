//
//  IsDisabledModifier.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 12.04.2022.
//

import SwiftUI

struct IsDisabledModifier: ViewModifier {
    
    var disabled: Bool
    
    func body(content: Content) -> some View {
        if disabled {
            content
                .grayscale(1)
                .opacity(0.4)
                .disabled(disabled)
        } else {
            content
        }
    }
}

extension View {
    func isDisabled(_ disabled: Bool) -> some View {
        self.modifier(IsDisabledModifier(disabled: disabled))
    }
}

#if DEBUG
struct IsDisabledModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button("Hello") {}
                .disabled(true)
            
            Button("Hello") {}
                .foregroundColor(.blue)
                .isDisabled(true)
            
            Button("Hello") {}
                .foregroundColor(.green)
                .isDisabled(true)
            
            Button("Hello") {}
                .foregroundColor(.red)
                .isDisabled(false)
 
            ETDropDownMenuView("Service*",
                               selected: .constant(ETDropDownMenuModel.mock),
                               menuItems: ETDropDownMenuModel.mockArray
            )
                .frame(width: 200, height: 200)
                .isDisabled(true)
        }
    }
}
#endif
