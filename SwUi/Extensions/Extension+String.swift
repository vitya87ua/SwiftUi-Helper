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
    
    // MARK: - US Zip Code
    var isZipCode: Bool {
        self.count == 5 && Int(self) != nil
    }
}
