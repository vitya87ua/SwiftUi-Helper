//
//  Log.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.07.2022.
//

import Foundation

public enum LogState: String {
    case info = "✅"
    case warning = "⚠️"
    case error = "‼️"
}

public enum LogType {
    case print(separator: String = " ")
    case dump(name: String? = nil, indent: Int = 0, maxDepth: Int = .max, maxItems: Int = .max)
}

public func Log(
    _ items: Any...,
    fileID: String = #fileID,
    line: Int = #line,
    funcName: String = #function,
    type: LogType = .print(),
    state: LogState = .info
) {
#if DEBUG
    let state: String = ((items.first as? Error) != nil) ? LogState.error.rawValue : state.rawValue
    let fileID: String = fileID.components(separatedBy: "/").last ?? fileID
    var date: String = Date().description
    
    if #available(iOS 15.0, macOS 12.0, *) {
        date = Date().formatted(date: .omitted, time: .standard)
    }
    
    switch type {
    case .print(separator: let separator):
        let arguments: String = items.map { String(describing: $0) }.joined(separator: separator)
        print(state, fileID, "⏰", date, "#️⃣", line, funcName, "⏩", arguments)
    case .dump(name: let name, indent: let indent, maxDepth: let maxDepth, maxItems: let maxItems):
        print(state, fileID, "⏰", date, "#️⃣", line, funcName, "⏩", "DUMP", "⬇️")
        dump(items, name: name, indent: indent, maxDepth: maxDepth, maxItems: maxItems)
    }
#endif
}

/*
 
 func some() {
     Log("Hello")
     Log("Hello", state: .warning)
     Log("Hello", state: .error)
     Log("Hello", type: .dump())
 }
 
 Terminal:
 ✅ Log.swift ⏰ 4:22:33 PM #️⃣ 43 some() ⏩ Hello
 ⚠️ Log.swift ⏰ 4:22:33 PM #️⃣ 44 some() ⏩ Hello
 ‼️ Log.swift ⏰ 4:22:33 PM #️⃣ 45 some() ⏩ Hello
 ✅ Log.swift ⏰ 4:22:33 PM #️⃣ 45 some() ⏩ DUMP ⬇️
 ▿ 1 element
   - "Hello"
 */
