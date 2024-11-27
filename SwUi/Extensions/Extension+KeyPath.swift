//
//  Extension+KeyPath.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 27.11.2024.
//

import Foundation

/// Usage: articles.filter(!\.isRead)
prefix func !<T>(keyPath: KeyPath<T, Bool>) -> (T) -> Bool {
    return { !$0[keyPath: keyPath] }
}

/// Usage: articles.filter(\.category == .fullLength)
func ==<T, V: Equatable>(lhs: KeyPath<T, V>, rhs: V) -> (T) -> Bool {
    return { $0[keyPath: lhs] == rhs }
}
