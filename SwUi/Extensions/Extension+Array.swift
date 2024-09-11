//
//  Extension+Array.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.01.2022.
//

import Foundation

extension Array {
    
    /// Break Array for Array with subArrays.
    /// ex: trimTail == true [1, 2, 3, 4, 5] -> [[1, 2], [3, 4]]
    /// ex: trimTail == false [1, 2, 3, 4, 5] -> [[1, 2], [3, 4], [5]]
    func breakInto(piecesOf: UInt, trimTail: Bool = false) -> [[Element]] {
        var resultArray: [[Element]] = []
        var tempArray: [Element] = []
        
        if self.count == piecesOf {
            resultArray = [self]
        } else {
            for (index, value) in self.enumerated() {
                if tempArray.count == piecesOf {
                    resultArray.append(tempArray)
                    tempArray.removeAll()
                    tempArray.append(value)
                    
                    if !trimTail && index == self.count - 1 {
                        resultArray.append(tempArray)
                    }
                } else {
                    tempArray.append(value)
                    
                    if !trimTail && index == self.count - 1 {
                        resultArray.append(tempArray)
                    }
                }
            }
        }
        
        return resultArray
    }
    
    func cutArray(forCount: Int) -> [Element] {
        var resultArray: [Element] = []
        
        if forCount <= count {
            for item in 0..<forCount {
                resultArray.append(self[item])
            }
        } else {
            print(#fileID, #line, "Error: forCount bigger than Array count")
        }
        
        return resultArray
    }
    
    func item(_ index: Int) -> Element? {
        guard self.indices.contains(index) else { return nil }
        return self[index]
    }
    
    /// Return sliced array with last items
    func lastItems(_ num: Int) -> [Element] {
        if isEmpty || num <= 0 {
            return []
        } else {
            if num >= count {
                return self
            } else {
                let d: Int = count - num
                return Array(self.suffix(from: d))
            }
        }
    }
}

extension Array where Element: BinaryFloatingPoint {
    func average() -> Double {
        if self.isEmpty {
            return .zero
        } else {
            let sum: Element = self.reduce(0, +)
            return Double(sum) / Double(self.count)
        }
    }
}

extension Array {
    func average<Value: BinaryFloatingPoint>(by keyPath: KeyPath<Element, Value>) -> Double {
        if self.isEmpty {
            return .zero
        } else {
            return self
                .map { $0[keyPath: keyPath] }
                .average()
        }
    }
}
