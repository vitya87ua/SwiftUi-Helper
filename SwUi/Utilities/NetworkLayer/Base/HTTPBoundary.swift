//
//  HTTPBoundary.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.12.2022.
//

import Foundation

typealias HTTPBoundary = String

extension HTTPBoundary {
    
    /// Auto generated boundary
    static var generate: HTTPBoundary = "Boundary-\(UUID().uuidString)"
}
