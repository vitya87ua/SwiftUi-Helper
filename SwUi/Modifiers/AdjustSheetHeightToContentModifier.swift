//
//  AdjustSheetHeightToContentModifier.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 09.04.2025.
//

import SwiftUI

@available(iOS 17.0, *)
private struct AdjustSheetHeightToContentModifier: ViewModifier {
    @State private var contentHeight: CGFloat = .zero
    
    private var contentHeightMeasurerView: some View {
        GeometryReader { geometry in
            Color.clear
                .onChange(of: geometry.size.height, initial: true) { _, newHeight in
                    contentHeight = newHeight
                }
        }
    }
    
    func body(content: Content) -> some View {
        content
            .background(contentHeightMeasurerView)
            .presentationDetents([.height(contentHeight)])
    }
}

@available(iOS 17.0, *)
extension View {
    func adjustSheetHeightToContent() -> some View {
        self.modifier(AdjustSheetHeightToContentModifier())
    }
}

@available(iOS 17.0, *)
struct AdjustSheetHeightToContentModifierView: View {
    var body: some View {
        Text("Hello, World!")
            .sheet(isPresented: .constant(true)) {
                // Sheet view
                ZStack {
                    /// View Content
                }
                .presentationCornerRadius(20)
                .presentationDragIndicator(.visible)
                .adjustSheetHeightToContent() // <-- Usage
            }
    }
}

@available(iOS 17.0, *)
#Preview {
    AdjustSheetHeightToContentModifierView()
}
