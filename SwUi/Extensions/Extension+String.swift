//
//  Extension+String.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 29.09.2021.
//

import SwiftUI
import Foundation

extension String {
    
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    
    // MARK: - Email
    var isEmail: Bool {
        do {
            let regex = try NSRegularExpression(
                pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}",
                options: .caseInsensitive
            )
            
            return regex.firstMatch(
                in: self,
                options:NSRegularExpression.MatchingOptions(rawValue: 0),
                range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
    
    // MARK: - PhoneNumber
    // +96 (123) 456-0990      returns false, smart enough to know if country phone code is valid as well,
    // +994 (123) 456-0990     returns true because +994 country code is an actual country phone code,
    // (123) 456-0990          returns true,
    // 123-456-0990            returns true,
    // 1234560990              returns true,
    var isPhoneNumber: Bool {
        let types: NSTextCheckingResult.CheckingType = [.phoneNumber]
        
        guard let detector = try? NSDataDetector(types: types.rawValue) else {
            return false
        }
        
        if let match = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count)).first?.phoneNumber {
            return match == self
        } else {
            return false
        }
    }
    
    var isURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
    
    // MARK: - US Zip Code
    var isZipCode: Bool {
        self.count == 5 && Int(self) != nil
    }
    
    func parseNumbers(andJoin: Bool = false) -> [Int] {
        var result: [Int] = []
        
        let strings: [String] = self.components(separatedBy: CharacterSet.decimalDigits.inverted)
        
        if andJoin, let int = Int(strings.joined()) {
            result = [int]
        } else {
            result = strings.compactMap { Int($0) }
        }
        
        return result
    }
}

extension String {
    
    enum CapitalizeOption {
        case none        // Text as is(without any changes)
        case never       // All text lowercased
        case characters  // All text uppercased
        case sentences   // Capitalize first word in each sentence
        case words       // Capitalize all words
    }
    
    func capitalize(option: CapitalizeOption) -> String {
        var result: String = ""
        
        switch option {
        case .none:
            result = self
        case .never:
            result = self.lowercased()
        case .characters:
            result = self.uppercased()
        case .sentences:
            
            var sentences: [String] = []
            
            for sentence in self.components(separatedBy: ". ") {
                if let firstChar = sentence.first, firstChar == " " {
                    let newSentence: String = String(sentence.dropFirst()).capitalizedSentence
                    sentences.append(newSentence)
                } else {
                    sentences.append(sentence.capitalizedSentence)
                }
            }
            
            result = sentences.joined(separator: ". ")
            
        case .words:
            result = self.capitalized
        }
        
        return result
    }
    
    var capitalizedSentence: String {
        let firstLetter = self.prefix(1).capitalized
        let remainingLetters = self.dropFirst().lowercased()
        return firstLetter + remainingLetters
    }
}
