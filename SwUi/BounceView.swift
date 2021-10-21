//
//  BounceView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 19.10.2021.
//

import SwiftUI

struct BounceView: View {
    var body: some View {
        HStack {
            Text("Hello, World!")
                .background(Color.red)
                .fillSpace(alignment: .leading, expanding: .vertical)
        }
    }
}

struct BounceViewModifier: ViewModifier {
    
    enum Expanding {
        case all
        case horizontal
        case vertical
    }
    
    let alignment: Alignment
    let expanding: Expanding

    func body(content: Content) -> some View {
        switch expanding {
        case .all:
            return content.frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: alignment
            )
        case .horizontal:
            return content.frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                alignment: alignment
            )
        case .vertical:
            return content.frame(
                minWidth: 0,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: alignment
            )
        }
    }
}

extension View {
    func fillSpace(alignment: Alignment = .leading, expanding: BounceViewModifier.Expanding = .all) -> some View {
        self.modifier(BounceViewModifier(alignment: alignment, expanding: expanding))
    }
}


#if DEBUG
struct BounceView_Previews: PreviewProvider {
    static var previews: some View {
        BounceView()
    }
}
#endif
