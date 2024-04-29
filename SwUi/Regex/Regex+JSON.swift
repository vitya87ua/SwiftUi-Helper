//
//  Regex+JSON.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 29.04.2024.
//

import Foundation
import RegexBuilder

// Find and extract JSON from String, return JSON substring
/*
 Input
 "{\n  \"chapters\": [\n  {\n    \"startTime\": \"0:02\",\n    \"name\": \"It was a bright cold day in April and the clocks was striking thirteen.\"\n  },\n  {\n    \"startTime\": \"0:07\",\n    \"name\": \"It was a bright cold day in April and the clocks were striking thirteen.\"\n  },\n  {\n    \"startTime\": \"0:12\",\n    \"name\": \"It was a bright cold day in April and the clocks were striking thirteen.\"\n  }\n]\n}"
 
 Output
 "[  {    \"startTime\": \"0:00\",    \"name\": \"Introduction\"  },  {    \"startTime\": \"1:55\",    \"name\": \"Arriving in Cambridge\"  },  {    \"startTime\": \"2:02\",    \"name\": \"Working with Bezikovich\"  },  {    \"startTime\": \"3:42\",    \"name\": \"Bezikovich\'s Style of Reasoning\"  },  {    \"startTime\": \"3:51\",    \"name\": \"Absorbing Bezikovich\'s Style\"  },  {    \"startTime\": \"4:06\",    \"name\": \"Bezikovich as an Important Resource\"  }]"
 */
@available(iOS 16.0, *)
func extractJSON(text: String) throws -> String {
    var stringJson: String = ""
    
    // Pattern: \[(.*?)\]
    let regex = Regex {
        "["
        Capture {
            ZeroOrMore(.reluctant) {
                /./
            }
        }
        "]"
    }
        .anchorsMatchLineEndings()
    
    guard
        let match = text.replacingOccurrences(of: "\n", with: "").firstMatch(of: regex)
    else { throw NSError(domain: "Can't Match Regex", code: 0) }
    stringJson = String(match.output.0)
    
    return stringJson
}

