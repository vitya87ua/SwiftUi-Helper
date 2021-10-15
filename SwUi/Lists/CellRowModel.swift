//
//  CellRowModel.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 24.09.2021.
//

import Foundation

struct CellRow: Hashable, Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let number: String
}

extension CellRow {
    static var defaultList: [CellRow] {
        [
            CellRow(name: "Joe", number: "3-433-622-4342"),
            CellRow(name: "Ola", number: "3-563-622-5653"),
            CellRow(name: "October", number: "3-525-622-2113"),
            CellRow(name: "May", number: "3-433-536-5225"),
            CellRow(name: "October", number: "3-525-622-2113"),
            CellRow(name: "Joe", number: "3-433-622-4342"),
            CellRow(name: "September", number: "3-878-622-4392"),
            CellRow(name: "May", number: "3-433-536-5225"),
            CellRow(name: "October", number: "3-525-622-2113"),
            CellRow(name: "Joe", number: "3-433-622-4342"),
            CellRow(name: "September", number: "3-878-622-4392")
        ]
    }
}
