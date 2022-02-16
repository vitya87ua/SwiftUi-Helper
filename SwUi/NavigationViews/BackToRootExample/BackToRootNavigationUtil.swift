//
//  BackToRootNavigationUtil.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 16.02.2022.
//

import Foundation

class NavigationUtil: ObservableObject {
    @Published var showRoot: Bool = false
    
    func backToRoot() {
        showRoot = true
    }
}
