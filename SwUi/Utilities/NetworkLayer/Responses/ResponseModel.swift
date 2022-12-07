//
//  ResponseModel.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.12.2022.
//

import Foundation

struct Response<T: Codable>: Codable {
    let success: Bool
    let message: String
    let data: T
}
