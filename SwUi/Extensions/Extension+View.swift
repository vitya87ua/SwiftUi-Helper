//
//  Extension+View.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 19.10.2021.
//

import Foundation
import SwiftUI

//#if canImport(UIKit)
//extension View {
//    func hideKeyboard() {
//        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
//}
//#endif

extension View {
    func withoutAnimation() -> some View {
        self.animation(nil, value: UUID())
    }
}

// MARK: - sensoryFeedback
@available(iOS 17.0, *)
extension View {
    /// Plays the specified `feedback` when the provided `trigger` value
    /// equals to provided `equal` value.
    ///
    /// Usage example:
    ///
    ///     struct MyView: View {
    ///
    ///         @State private var isPresented: Bool = false
    ///         @State private var number: Int = 0
    ///
    ///         var body: some View {
    ///             VStack(spacing: 16) {
    ///
    ///                 /// Fire when isPresented == true
    ///                 Button("Done") {
    ///                     isPresented.toggle()
    ///                 }
    ///                 .sensoryFeedback(.impact, trigger: isPresented, equal: true)
    ///
    ///                 /// Fire when number == 5
    ///                 Button("+") {
    ///                     number += 1
    ///                 }
    ///                 .sensoryFeedback(.impact, trigger: number, equal: 5)
    ///             }
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - feedback: Which type of feedback to play.
    ///   - trigger: A value to monitor for changes.
    ///   - equal: A value to compare for equals to determine when to play.
    func sensoryFeedback<T>(
        _ feedback: SensoryFeedback,
        trigger: T,
        equal: T
    ) -> some View where T : Equatable {
        self.sensoryFeedback(feedback, trigger: trigger) { _, newValue in
            newValue == equal
        }
    }
}
