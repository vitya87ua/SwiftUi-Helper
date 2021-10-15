//
//  TempViewModel.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 15.09.2021.
//

import Foundation

struct Some {
    let name: String
    let action: () -> Void
}

final class TempViewModel {
    var model: [Some] {
        [
            Some(name: "", action: actrme)
        ]
    }

    func actrme() {

    }
}
