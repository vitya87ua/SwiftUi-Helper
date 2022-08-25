//
//  PropertyWrappers.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 25.08.2022.
//

import Foundation

@propertyWrapper
struct TenOrLess {
    private var number: Int = 0
    
    var wrappedValue: Int {
        get { number }
        set {
            if newValue > 10 {
                number = 10
            } else {
                number = newValue
            }
        }
    }
}

/*
 struct Rect {
     @TenOrLess var height: Int
     @TenOrLess var weight: Int
 }

 var rect = Rect()
 rect.height = 55 // set 10
 rect.weight = 8  // set 8
 
 */


// MARK: - With value
@propertyWrapper
struct MinimumNumber {
    private var value: Int
    private var minimumNumber: Int
    
    var wrappedValue: Int {
        get { value }
        set {
            if newValue < minimumNumber {
                value = minimumNumber
            } else {
                value = newValue
            }
        }
    }
    
    init(minimum number: Int) {
        self.value = number
        self.minimumNumber = number
    }
}

/*
 struct Rect {
     @MinimumNumber(minimum: 16) var height: Int
     @MinimumNumber(minimum: 3) var weight: Int
 }

 var rect = Rect()
 rect.height = 10 // set 16
 rect.weight = 8  // set 8
 rect.height
 rect.weight

 */
