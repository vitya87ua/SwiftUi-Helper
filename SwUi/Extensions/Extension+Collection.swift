//
//  Extension+Collection.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 28.11.2023.
//

import Foundation

extension Collection {
    func count(where test: (Element) throws -> Bool) rethrows -> Int {
        return try self.filter(test).count
    }
}

extension Collection {
    
    /// Reorder one array based on another array, by them values
    /// - Parameters:
    ///   - keyPath: value of source array
    ///   - template: template array
    ///   - templateKeyPath: value of template array
    /// - Returns: Reordered array of source elements
    /// Example:
    /// let users = [User(id: "2"), User(id: "1"), User(id: "4"), User(id: "3")]
    /// let cars: [Car] = [Car(num: "4"), Car(num: "2")]
    /// let result = users.reorder(by: \.id, template: cars, by: \.num)
    /// print(result.map(\.id)) -> "["4", "2", "1", "3"]"
    func reorder<Value: Equatable, Template: Collection>(
        by keyPath: KeyPath<Element, Value>,
        template: Template,
        by templateKeyPath: KeyPath<Template.Element, Value>
    ) -> [Element] {
        var result: [Element] = []
        
        var tempArr: [Element] = Array(self)
        
        for element in template {
            let value: Value = element[keyPath: templateKeyPath]
            
            if let index = tempArr.firstIndex(where: { $0[keyPath: keyPath] == value }) {
                result.append(tempArr[index])
                tempArr.remove(at: index)
            }
        }
        
        result.append(contentsOf: tempArr)
        
        return result
    }
}

extension Collection where Element: Equatable {
    func reorder(template: [Element]) -> [Element] {
        var result: [Element] = []
        
        var tempArr: [Element] = Array(self)
        
        for element in template {
            if let index = tempArr.firstIndex(where: { $0 == element }) {
                result.append(tempArr[index])
                tempArr.remove(at: index)
            }
        }
        
        result.append(contentsOf: tempArr)
        
        return result
    }
}

