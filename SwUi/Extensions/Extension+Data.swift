//
//  Extension+Data.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 26.04.2022.
//

import Foundation

extension Data {
    
    ///  JSON = "{\"foo\": \"bar\"}"
    ///  Standard print(json) -->  {\"foo\": \"bar\"}
    ///  PrettyJson print(json.prettyJson) ↓↓↓
    ///  {
    ///    "foo" : "bar"
    ///  }
    var prettyJson: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted, .sortedKeys]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        else { return nil }

        return prettyPrintedString
    }
}
