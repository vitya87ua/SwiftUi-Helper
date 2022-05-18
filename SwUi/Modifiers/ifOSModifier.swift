//
//  ifOSModifier.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 17.05.2022.
//
// https://localcoder.org/in-swiftui-is-it-possible-to-use-a-modifier-only-for-a-certain-os-target

import SwiftUI

enum OperatingSystem {
    case macOS
    case iOS
    case tvOS
    case watchOS

    #if os(macOS)
    static let current = macOS
    #elseif os(iOS)
    static let current = iOS
    #elseif os(tvOS)
    static let current = tvOS
    #elseif os(watchOS)
    static let current = watchOS
    #else
    #error("Unsupported platform")
    #endif
}

extension View {
    @ViewBuilder
    func ifOS<Content: View>(
        _ operatingSystems: OperatingSystem...,
        modifier: (Self) -> Content
    ) -> some View {
        if operatingSystems.contains(OperatingSystem.current) {
            modifier(self)
        } else {
            self
        }
    }
}

struct ifOSModifier: View {
    var body: some View {
        Text("Hello, World!")
            .ifOS(.iOS) { view in
                view
                    .foregroundColor(.red)
            }
    }
}

#if DEBUG
struct ifOSModifier_Previews: PreviewProvider {
    static var previews: some View {
        ifOSModifier()
    }
}
#endif
