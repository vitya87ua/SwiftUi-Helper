//
//  Log.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.07.2022.
//

import Foundation

public func Log(
    _ items: Any...,
    fileID: String = #fileID,
    line: Int = #line,
    funcName: String = #function
) {
#if DEBUG
    if #available(iOS 15.0, macOS 12.0, *) {
        print("✅", fileID.components(separatedBy: "/").last ?? fileID, "⏰", Date().formatted(date: .omitted, time: .standard), "#️⃣", line, funcName, "⏩", items.map { String(describing: $0) }.joined(separator: " "))
    } else {
        print("✅", fileID.components(separatedBy: "/").last ?? fileID, "⏰", Date(), "#️⃣", line, funcName, "⏩", items.map { String(describing: $0) }.joined(separator: " "))
    }
#endif
}
