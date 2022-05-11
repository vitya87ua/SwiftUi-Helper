//
//  SwipeGesture.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 11.05.2022.
//

import SwiftUI

public struct SwipeGesture: Gesture {
    public enum Direction: String {
        case left, right, up, down
    }
    
    public typealias Value = Direction
    
    private let minimumDistance: CGFloat
    private let coordinateSpace: CoordinateSpace
    
    public init(minimumDistance: CGFloat = 10, coordinateSpace: CoordinateSpace = .local) {
        self.minimumDistance = minimumDistance
        self.coordinateSpace = coordinateSpace
    }
    
    public var body: AnyGesture<Value> {
        AnyGesture(
            DragGesture(minimumDistance: minimumDistance, coordinateSpace: coordinateSpace)
                .map { value in
                    let horizontalAmount = value.translation.width
                    let verticalAmount = value.translation.height
                    
                    if abs(horizontalAmount) > abs(verticalAmount) {
                        if horizontalAmount < 0 { return .left } else { return .right }
                    } else {
                        if verticalAmount < 0 { return .up } else { return .down }
                    }
                }
        )
    }
}

public extension View {
    func onSwipe(
        minimumDistance: CGFloat = 10,
        coordinateSpace: CoordinateSpace = .local,
        perform: @escaping (SwipeGesture.Direction) -> Void
    ) -> some View {
        gesture(
            SwipeGesture(
                minimumDistance: minimumDistance,
                coordinateSpace: coordinateSpace
            )
            .onEnded(perform)
        )
    }
}
