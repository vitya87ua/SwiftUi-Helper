//
//  MultiplayerKey.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 21.01.2022.
//
// https://www.fivestars.blog/articles/custom-environment-values-cheatsheet/

import Foundation
import SwiftUI

struct MultiplayerKey: EnvironmentKey {
    static let defaultValue: Int = 5
}

extension EnvironmentValues {
    var multiplayerKey: Int {
        get { self[MultiplayerKey.self] }
        set { self[MultiplayerKey.self] = newValue }
    }
}


// You сan use this EnvironmentKey & EnvironmentValues for following forEx; LoginState of ColorTheme. See link in header
struct FetcherKey: EnvironmentKey {
    static let defaultValue: Fetcher = Fetcher()
}

extension EnvironmentValues {
    var fetcherKey: Fetcher {
        get { self[FetcherKey.self] }
        set { self[FetcherKey.self] = newValue }
    }
}

final class Fetcher {
        
    var coun: Int = 0
    
    func getDef() -> Int {
        9
    }
    
    func getMul(_ num: Int) -> Int {
        9 * num
    }
    
    func getRan() -> Int {
        Int.random(in: 0...100)
    }
    
    func incr() {
        coun += getRan()
    }
}
