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

/// Logs messages to the console with detailed metadata including file, line, function, and timestamp.
///
/// The `Log` function supports two logging types: simple `print` and structured `dump`.
/// It also automatically categorizes logs based on whether the first item is an `Error`,
/// and adjusts the log state accordingly.
///
/// - Parameters:
///   - items: A variadic list of items to log. Can include any type. If the first item is an `Error`, the log will be marked as `.error`.
///   - fileID: The file identifier where the log was called. Defaults to the last path component of `#fileID`.
///   - line: The line number where the log was invoked. Automatically captured using `#line`.
///   - funcName: The function name from which the log was called. Captured using `#function`.
///   - type: The logging output type, either `.print` for flat logging or `.dump` for detailed structure output.
///   - state: The log severity level, such as `✅ .info`, `⚠️ .warning`, or `‼️ .error`. Automatically set to `.error` if the first `item` is an `Error`.
///
/// - Important:
///   - `fileID`, `line` and `funcName` captured automatically and should not be set manually.
///   - For iOS 15+ and macOS 12+, the timestamp uses a localized time-only format. On earlier versions, the full `Date.description` is used.
///
/// - Example:
/// ```swift
/// func some() {
///     Log("Hello")
///     Log("Hello", state: .warning)
///     Log("Hello", state: .error) // Will auto-detect as .error
///     Log("Hello", type: .dump())
/// }
///
/// /*
/// Terminal:
/// ✅ Log.swift ⏰ 4:22:33 PM #️⃣ 43 some() ⏩ Hello
/// ⚠️ Log.swift ⏰ 4:22:33 PM #️⃣ 44 some() ⏩ Hello
/// ‼️ Log.swift ⏰ 4:22:33 PM #️⃣ 45 some() ⏩ Hello
/// ✅ Log.swift ⏰ 4:22:33 PM #️⃣ 45 some() ⏩ DUMP ⬇️
/// ▿ 1 element
///   - "Hello"
/// */
/// ```
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
