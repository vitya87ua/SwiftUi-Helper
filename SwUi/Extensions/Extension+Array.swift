//
//  Extension+Array.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.01.2022.
//

import Foundation

extension Array {
    
    /// Break Array for Array with subArrays. ex: [1, 2, 3, 4, 5] -> [[1, 2], [3, 4], [5]]
    func breakInto(piecesOf: UInt, trimTail: Bool = false) -> [[Element]] {
        var resultArray: [[Element]] = []
        var tempArray: [Element] = []
        
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
}
