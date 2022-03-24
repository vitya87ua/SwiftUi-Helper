//
//  CornerRadiusModifierView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 24.03.2022.
//

import SwiftUI

struct CornerRadiusModifierView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.yellow)
                .equalFrame(100)
                .cornerRadius(15, corners: .leading)
            
            Rectangle()
                .fill(Color.red)
                .equalFrame(100)
                .cornerRadius(15, corners: [.topLeft, .bottomRight])
        }
    }
}

struct CornerRadiusModifier: ViewModifier {
    
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct CornerRadiusShape: Shape {
        
        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners
        
        func path(in rect: CGRect) -> Path {
            let path: UIBezierPath = UIBezierPath(
                roundedRect: rect,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            )
            
            return Path(path.cgPath)
        }
    }
    
    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        self.modifier(CornerRadiusModifier(radius: radius, corners: corners))
    }
    
    func cornerRadius(_ radius: CGFloat, corners: Edge) -> some View {
        switch corners {
        case .top:
            return self.modifier(CornerRadiusModifier(radius: radius, corners: [.topLeft, .topRight]))
        case .leading:
            return self.modifier(CornerRadiusModifier(radius: radius, corners: [.topLeft, .bottomLeft]))
        case .bottom:
            return self.modifier(CornerRadiusModifier(radius: radius, corners: [.bottomLeft, .bottomRight]))
        case .trailing:
            return self.modifier(CornerRadiusModifier(radius: radius, corners: [.topRight, .bottomRight]))
        }
    }
}

#if DEBUG
struct CornerRadiusModifierView_Previews: PreviewProvider {
    static var previews: some View {
        CornerRadiusModifierView()
    }
}
#endif
