//
//  Debounce.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 23.08.2022.
//

import Foundation
import Dispatch

final class Debounce<T: Equatable> {

    private init() {}

    static func input(
        _ input: T,
        deadline: TimeInterval,
        comparedAgainst current: @escaping @autoclosure () -> (T),
        perform: @escaping (T) -> ()
    ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + deadline) {
            if input == current() { perform(input) }
        }
    }
}

// MARK: - Usage
/*
 
 // simpleText changed
 var simpleText: String = "" {
     didSet {
         Debounce<String>.input(simpleText, deadline: 1, comparedAgainst: self.simpleText) { [weak self] result in
             Log(result, state: .warning)
         }
     }
 }
 
 */
