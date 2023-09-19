//
//  Modify.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 11.11.2022.
//

import SwiftUI

extension View {
    func modify<Content>(@ViewBuilder _ transform: (Self) -> Content) -> Content {
        transform(self)
    }
}

// MARK: - Usage

/*
 SecureField("required", text: $viewModel.password)
     .frame(width: 250, alignment: .leading)
     .modify { view in
         if #available(macOS 12.0, *) {
             view.onSubmit {
                 // DO SOME
             }
         }
     }
 */
