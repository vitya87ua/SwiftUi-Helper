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
}
