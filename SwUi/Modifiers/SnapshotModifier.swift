//
//  SnapshotModifier.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 04.01.2026.
//

import SwiftUI

// Create View Snapshot
struct SnapshotModifier: ViewModifier {
    var trigger: Bool
    var onComplete: (UIImage) -> Void
    
    @State private var view: UIView = .init(frame: .zero)
    
    func body(content: Content) -> some View {
        if #available(iOS 17.0, *) {
            content
                .background(ViewExtractor(view: view))
                .compositingGroup()
                .onChange(of: trigger) { oldValue, newValue in
                    guard newValue else { return }
                    renderSnapshot()
                }
        } else {
            content
                .background(ViewExtractor(view: view))
                .compositingGroup()
                .onChange(of: trigger) { newValue in
                    guard newValue else { return }
                    renderSnapshot()
                }
        }
    }
    
    private func renderSnapshot() {
        if let superview = view.superview?.superview {
            let renderer: UIGraphicsImageRenderer = UIGraphicsImageRenderer(size: superview.bounds.size)
            
            let image = renderer.image { _ in
                superview.drawHierarchy(in: superview.bounds, afterScreenUpdates: true)
            }
            
            onComplete(image)
        }
    }
}

struct ViewExtractor: UIViewRepresentable {
    let view: UIView
    
    func makeUIView(context: Context) -> some UIView {
        view.backgroundColor = .clear
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}

extension View {
    func snapshot(trigger: Bool, onComplete: @escaping (UIImage) -> Void) -> some View {
        self.modifier(SnapshotModifier(trigger: trigger, onComplete: onComplete))
    }
}
