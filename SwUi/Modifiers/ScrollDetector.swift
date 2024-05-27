//
//  ScrollDetector.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 27.05.2024.
//

import SwiftUI

// MARK: - USAGE
/*
struct MyView: View {
    var body: some View {
        ScrollView {
            VStack {
                // Scroll View Content
            }
            // Get ScrollView offset
            .onScrollChange { offset in
                // do some
            }
            
            // OR Get ScrollView offset and DraggingEnd offset & velocity
            .onScrollChange { offset in
                // do some
            } onDraggingEnd: { offset, velocity in
                // do some
            }
        }
    }
}
*/

struct ScrollDetector: UIViewRepresentable {
    
    var onScroll: (_ offset: CGPoint) -> Void
    var onDraggingEnd: ((_ offset: CGPoint, _ velocity: CGPoint) -> Void)?
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        
        var parent: ScrollDetector
        
        var isDelegateAdded: Bool = false
        
        init(parent: ScrollDetector) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.onScroll(scrollView.contentOffset)
        }
        
        func scrollViewWillEndDragging(
            _ scrollView: UIScrollView,
            withVelocity velocity: CGPoint,
            targetContentOffset: UnsafeMutablePointer<CGPoint>
        ) {
            parent.onDraggingEnd?(targetContentOffset.pointee, velocity)
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            parent.onDraggingEnd?(scrollView.contentOffset, .zero)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIView {
        let uiView: UIView = UIView()
        
        DispatchQueue.main.async {
            if let scrollView = recursiveFindScrollView(view: uiView), !context.coordinator.isDelegateAdded {
                scrollView.delegate = context.coordinator
                context.coordinator.isDelegateAdded = true
            }
        }
        
        return uiView
    }
    
    func recursiveFindScrollView(view: UIView) -> UIScrollView? {
        if let scrollView = view as? UIScrollView {
            return scrollView
        } else {
            if let superview = view.superview {
                return recursiveFindScrollView(view: superview)
            } else {
                return nil
            }
        }
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

extension View {
    func onScrollChange(
        offset: @escaping (_ offset: CGPoint) -> Void,
        onDraggingEnd: ((_ offset: CGPoint, _ velocity: CGPoint) -> Void)? = nil
    ) -> some View {
        self.background {
            ScrollDetector(onScroll: offset, onDraggingEnd: onDraggingEnd)
        }
    }
}
