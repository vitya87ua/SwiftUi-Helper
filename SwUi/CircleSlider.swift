//
//  CircleSlider.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 19.12.2022.
//

import SwiftUI

struct CircleSlider: View {
    @State var progress: Double
    
    @State private var rotationAngle = Angle(degrees: 0)
    private var minValue = 0.0
    private var maxValue = 1.0
    
    var changed: (Double) -> Void
    
    init(value progress: Double, minBounds: Int, maxBounds: Int, changed: @escaping (Double) -> Void) {
        self.progress = progress
        
        self.minValue = Double(minBounds)
        self.maxValue = maxBounds == 0 ? 1 : Double(maxBounds)
        self.changed = changed
        self.rotationAngle = Angle(degrees: progressFraction * 90.0)
    }
    
    var body: some View {
        GeometryReader { gr in
            let radius = (min(gr.size.width, gr.size.height) / 2.0) * 0.9
            let sliderWidth = radius * 0.2
            let thumbWidth = radius * 0.3
            
            VStack(spacing:0) {
                ZStack {
                    Circle()
                        .trim(from: 0, to: 0.25)
                        .stroke(Color.black.opacity(0.3),
                                style: StrokeStyle(lineWidth: sliderWidth, lineCap: .round)
                        )
                        .rotationEffect(Angle(degrees: -90))
                    
                    Circle()
                        .trim(from: 0, to: (0.25 / 90) * rotationAngle.degrees)
                        .stroke(Color.blue.opacity(0.5),
                                style: StrokeStyle(lineWidth: sliderWidth, lineCap: .round)
                        )
                        .rotationEffect(Angle(degrees: -90))
                    
                    Circle()
                        .fill(Color.white)
                        .shadow(radius: (thumbWidth * 0.3))
                        .frame(width: thumbWidth, height: thumbWidth)
                        .offset(y: -radius)
                        .rotationEffect(rotationAngle)
                        .gesture(
                            DragGesture(minimumDistance: 0.0)
                                .onChanged() { value in
                                    changeAngle(location: value.location)
                                }
                        )
                }
                .frame(width: radius * 2.0, height: radius * 2.0, alignment: .center)
                .padding(radius * 0.1)
            }
            .onAppear {
                if progress < 0 {
                    rotationAngle = .zero
                } else if progress > maxValue {
                    rotationAngle = Angle(degrees: 90)
                } else {
                    self.rotationAngle = Angle(degrees: progressFraction * 90.0)
                }
            }
        }
    }
    
    private var progressFraction: Double {
        return ((progress - minValue) / (maxValue - minValue))
    }
    
    private func changeAngle(location: CGPoint) {
        // Create a Vector for the location (reversing the y-coordinate system on iOS)
        let vector = CGVector(dx: location.x, dy: -location.y)
        
        // Calculate the angle of the vector
        let angleRadians = atan2(vector.dx, vector.dy)
        
        // Convert the angle to a range from 0 to 360 (rather than having negative angles)
        let positiveAngle = angleRadians < 0.0 ? angleRadians + (2.0 * .pi) : angleRadians
        
        // Update slider progress value based on angle
        progress = ((positiveAngle / (2.0 * .pi)) * (maxValue - minValue)) + minValue
        let angle = Angle(radians: positiveAngle)
        
        if (270...360).contains(angle.degrees) {
            rotationAngle = .zero
        } else if (91...269).contains(angle.degrees) {
            rotationAngle = Angle(degrees: 90)
        } else {
            rotationAngle = Angle(radians: positiveAngle)
        }
        
        let res = (maxValue / 90) * rotationAngle.degrees
        
        changed(res)
    }
}

#if DEBUG
struct CircleSlider_Previews: PreviewProvider {
    static var previews: some View {
        CircleSlider(value: 40, minBounds: 0, maxBounds: 90) { _ in }
            .padding()
    }
}
#endif
