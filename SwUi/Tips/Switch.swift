//
//  Switch.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 27.07.2022.
//

import Foundation

let result: Result<String, Error> = .success("Hello")

// MARK: - Case Let - A Recap
func func0() {
    switch result {
    case .success(_):
        print("without data")
        
    case .failure(_):
        print("without error")
    }
}

func func1() {
    switch result {
    case .success(let data):
        print(data)
        
    case .failure(let error):
        print(error)
    }
}

func func2() {
    switch result {
    case let .success(data):
        print(data)
        
    case let .failure(error):
        print(error)
    }
}

func func3() {
    switch result {
    case let .success(data) where data == "Hello":
        print(data)
        
    case let .failure(error):
        print(error)
        
    case .success(_): // Need because first success with where.
        break
    }
}

// MARK: - If statement
func statement1() {
    if case let .success(data) = result {
        print(data)
    }
}

func statement2() {
    if case .success = result {
        print("Check only if success, without binding data!")
    }
}

func statement3() {
    if case .success(let data) = result {
        print(data)
    }
}

func statement4() {
    if case let .success(data) = result, data == "Hello" {
        print(data)
    }
}

// MARK: - Guard statement

func statement5() {
    guard
        case let .success(data) = result
    else { return }
    
    print(data)
}
