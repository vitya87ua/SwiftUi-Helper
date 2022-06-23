//
//  Extension+Sequence.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 23.06.2022.
//

import Foundation

extension Sequence {
    
    func map<T>(by keyPath: KeyPath<Element, T>) -> [T] {
        self.map { $0[keyPath: keyPath] }
    }
    
    func compactMap<T>(by keyPath: KeyPath<Element, T>) -> [T] {
        self.compactMap { $0[keyPath: keyPath] }
    }
    
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>, ascending: Bool = true) -> [Element] {
        if ascending {
            return self.sorted { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
        } else {
            return self.sorted { $0[keyPath: keyPath] > $1[keyPath: keyPath] }
        }
    }
}
