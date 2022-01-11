//
//  ProgressCircleView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 10.01.2022.
//

import SwiftUI

struct ProgressCircleView: View {
    
    let progressValue: Double
    let textValue: Double?
    
    init(progressValue: Double, textValue: Double? = nil) {
        self.progressValue = progressValue
        self.textValue = textValue
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.4), lineWidth: lineWidth(diameter: geometry.size.height))
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(progressValue) / 100.0)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth(diameter: geometry.size.height), lineCap: .butt, lineJoin: .round))
                    .foregroundColor(.yellow)
                    .rotationEffect(Angle(degrees: 270))
                
                Text(getText())
                    .font(.system(size: geometry.size.height / 2.14))
                    .foregroundColor(.white)
                
            }
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        })
    }
    
    private func getText() -> String {
        var result: String = "0"
        
        if let textValue = textValue {
            if textValue > 0 {
                result = String(Int(textValue))
            }
        } else {
            if progressValue > 0 {
                result = String(Int(progressValue))
            }
        }
        
        return result
    }
    
    private func lineWidth(diameter: CGFloat) -> CGFloat {
        diameter / 13
    }
}

#if DEBUG
struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.purple
            
            VStack(spacing: 20) {
                ProgressCircleView(progressValue: 45)
                    .frame(width: 60, height: 60)
                
                ProgressCircleView(progressValue: 4)
                    .frame(width: 96, height: 96)
                
                ProgressCircleView(progressValue: 4, textValue: 28)
                    .frame(width: 120, height: 120)
            }
        }
    }
}
#endif
