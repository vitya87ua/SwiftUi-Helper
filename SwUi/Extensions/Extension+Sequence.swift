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

// MARK: - Async/Await. Async and concurrent versions of forEach and map
// https://www.swiftbysundell.com/articles/async-and-concurrent-forEach-and-map

// Async, call one by one
extension Sequence {
    func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()
        
        for element in self {
            try await values.append(transform(element))
        }
        
        return values
    }
    
    func asyncForEach(
        _ operation: (Element) async throws -> Void
    ) async rethrows {
        for element in self {
            try await operation(element)
        }
    }
}

// Concurrent call all at one time and wait to complete all tasks
extension Sequence {
    func concurrentMap<T>(
        _ transform: @escaping (Element) async throws -> T
    ) async throws -> [T] {
        let tasks = map { element in
            Task {
                try await transform(element)
            }
        }
        
        return try await tasks.asyncMap { task in
            try await task.value
        }
    }
    
    func concurrentForEach(
        _ operation: @escaping (Element) async -> Void
    ) async {
        // A task group automatically waits for all of its
        // sub-tasks to complete, while also performing those
        // tasks in parallel:
        await withTaskGroup(of: Void.self) { group in
            for element in self {
                group.addTask {
                    await operation(element)
                }
            }
        }
    }
}

// https://forums.swift.org/t/uniquing-elements-in-a-sequence/16603
extension Sequence where Element: Hashable {
    func unique() -> [Element] {
        return unique(by: { $0 })
    }
}
extension Sequence {
    /// Remove duplicate items by particular element
    func unique<T: Hashable>(by propertyAccessor: (Element) -> T) -> [Element] {
        var seen: Set<T> = []
        var result: [Element] = []
        for element in self {
            let property = propertyAccessor(element)
            if !seen.contains(property) {
                result.append(element)
                seen.insert(property)
            }
        }
        return result
    }
}
