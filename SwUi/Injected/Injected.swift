//
//  Injected.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.04.2022.
//
// Source -> https://www.avanderlee.com/swift/dependency-injection/

import Foundation

@propertyWrapper
struct Injected<T> {
    private let keyPath: WritableKeyPath<InjectedValues, T>
    
    var wrappedValue: T {
        get { InjectedValues[keyPath] }
        set { InjectedValues[keyPath] = newValue }
    }
    
    init(_ keyPath: WritableKeyPath<InjectedValues, T>) {
        self.keyPath = keyPath
    }
}

public protocol InjectionKey {
    
    /// The associated type representing the type of the dependency injection key's value.
    associatedtype Value
    
    /// The default value for the dependency injection key.
    static var currentValue: Self.Value { get set }
}

struct InjectedValues {
    
    /// This is only used as an accessor to the computed properties within extensions of `InjectedValues`.
    private static var current: InjectedValues = InjectedValues()
    
    /// A static subscript for updating the `currentValue` of `InjectionKey` instances.
    static subscript<K>(key: K.Type) -> K.Value where K : InjectionKey {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }
    
    /// A static subscript accessor for updating and references dependencies directly.
    static subscript<T>(_ keyPath: WritableKeyPath<InjectedValues, T>) -> T {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}


// MARK: -  Add NEW Property Example ↓↓↓

// Add Property Key
private struct RealmDBKey: InjectionKey {
    static var currentValue: RealmDB = RealmDB()
}

// Add Property Value
extension InjectedValues {
    var realm: RealmDB {
        get { Self[RealmDBKey.self] }
        set { Self[RealmDBKey.self] = newValue }
    }
}

// Another property key(Example)
private struct MyNumberKey: InjectionKey {
    static var currentValue: MyNumber = MyNumber()
}

extension InjectedValues {
    var myNumber: MyNumber {
        get { Self[MyNumberKey.self] }
        set { Self[MyNumberKey.self] = newValue }
    }
}

final class MyNumber: ObservableObject {
    func calTotal() {
        
    }
}


// MARK: - Usage Example ↓↓↓

class RealmDB { // Realm class, like manager
    func fetchAllUsers() {
        
    }
}

final class Some: ObservableObject { // <- viewModel
    
    @Injected(\.realm) var realm: RealmDB
    @Injected(\.myNumber) var myNumber: MyNumber
    
    func fetchData() {
        realm.fetchAllUsers()
    }
    
    func total() {
        myNumber.calTotal()
    }
}

