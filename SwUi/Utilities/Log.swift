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

public func Log(
    _ items: Any...,
    fileID: String = #fileID,
    line: Int = #line,
    funcName: String = #function,
    state: LogState = .info
) {
#if DEBUG
    if #available(iOS 15.0, macOS 12.0, *) {
        print(
            ((items.first as? Error) != nil) ? LogState.error.rawValue : state.rawValue,
            fileID.components(separatedBy: "/").last ?? fileID,
            "⏰", Date().formatted(date: .omitted, time: .standard),
            "#️⃣", line,
            funcName,
            "⏩", items.map { String(describing: $0) }.joined(separator: " ")
        )
    } else {
        print(
            ((items.first as? Error) != nil) ? LogState.error.rawValue : state.rawValue,
            fileID.components(separatedBy: "/").last ?? fileID,
            "⏰", Date(),
            "#️⃣", line,
            funcName,
            "⏩", items.map { String(describing: $0) }.joined(separator: " ")
        )
    }
#endif
}

/*
 
 func some() {
     Log("Hello")
     Log("Hello", state: .warning)
     Log("Hello", state: .error)
 }
 
 Terminal:
 ✅ Log.swift ⏰ 4:22:33 PM #️⃣ 43 some() ⏩ Hello
 ⚠️ Log.swift ⏰ 4:22:33 PM #️⃣ 44 some() ⏩ Hello
 ‼️ Log.swift ⏰ 4:22:33 PM #️⃣ 45 some() ⏩ Hello
 
 */
