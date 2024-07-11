//
//  SensoryFeedbacksView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 11.07.2024.
//

import SwiftUI

struct SensoryFeedbacksView: View {
    
    @State private var alignment: Int = 0
    @State private var decrease: Int = 0
    @State private var error: Int = 0
    @State private var impact: Int = 0
    @State private var increase: Int = 0
    @State private var levelChange: Int = 0
    @State private var selection: Int = 0
    @State private var start: Int = 0
    @State private var stop: Int = 0
    @State private var success: Int = 0
    @State private var warning: Int = 0
    
    @State private var impactflexibilityrigid: Int = 0
    @State private var rigid: Double = 1
    
    @State private var impactflexibilitysoft: Int = 0
    @State private var soft: Double = 1
    
    @State private var impactflexibilitysolid: Int = 0
    @State private var solid: Double = 1
    
    
    @State private var impactweightlight: Int = 0
    @State private var light: Double = 1
    
    @State private var impactweightmedium: Int = 0
    @State private var medium: Double = 1
    
    @State private var impactweightheavy: Int = 0
    @State private var heavy: Double = 1
    
    var body: some View {
        if #available(iOS 17.0, *) {
            ScrollView {
                Button("alignment".capitalized) {
                    alignment += 1
                }
                .sensoryFeedback(.alignment, trigger: alignment)
                
                Button("increase".capitalized) {
                    increase += 1
                }
                .sensoryFeedback(.increase, trigger: increase)
                
                Button("decrease".capitalized) {
                    decrease += 1
                }
                .sensoryFeedback(.decrease, trigger: decrease)
                
                Button("error".capitalized) {
                    error += 1
                }
                .sensoryFeedback(.error, trigger: error)
                
                Button("impact".capitalized) {
                    impact += 1
                }
                .sensoryFeedback(.impact, trigger: impact)
                
                Button("levelChange".capitalized) {
                    levelChange += 1
                }
                .sensoryFeedback(.levelChange, trigger: levelChange)
                
                Button("selection".capitalized) {
                    selection += 1
                }
                .sensoryFeedback(.selection, trigger: selection)
                
                Button("start".capitalized) {
                    start += 1
                }
                .sensoryFeedback(.start, trigger: start)
                
                Button("stop".capitalized) {
                    stop += 1
                }
                .sensoryFeedback(.stop, trigger: stop)
                
                Button("success".capitalized) {
                    success += 1
                }
                .sensoryFeedback(.success, trigger: success)
                
                Button("warning".capitalized) {
                    warning += 1
                }
                .sensoryFeedback(.warning, trigger: warning)
                
                VStack {
                    HStack(spacing: 30) {
                        Button("impact flexibility rigid".capitalized) {
                            impactflexibilityrigid += 1
                        }
                        .sensoryFeedback(.impact(flexibility: .rigid, intensity: rigid), trigger: impactflexibilityrigid)
                        
                        Stepper(rigid.formatted(), value: $rigid, step: 0.1)
                    }
                    
                    HStack(spacing: 30) {
                        Button("impact flexibility soft".capitalized) {
                            impactflexibilitysoft += 1
                        }
                        .sensoryFeedback(.impact(flexibility: .soft, intensity: soft), trigger: impactflexibilitysoft)
                        
                        Stepper(soft.formatted(), value: $soft, step: 0.1)
                    }
                    
                    HStack(spacing: 30) {
                        Button("impact flexibility solid".capitalized) {
                            impactflexibilitysolid += 1
                        }
                        .sensoryFeedback(.impact(flexibility: .solid, intensity: solid), trigger: impactflexibilitysolid)
                        
                        Stepper(solid.formatted(), value: $solid, step: 0.1)
                    }
                }
                .border(Color.blue.opacity(0.5))
                
                VStack {
                    HStack(spacing: 30) {
                        Button("impact weight light".capitalized) {
                            impactweightlight += 1
                        }
                        .sensoryFeedback(.impact(weight: .light, intensity: light), trigger: impactweightlight)
                        
                        Stepper(light.formatted(), value: $light, step: 0.1)
                    }
                    
                    HStack(spacing: 30) {
                        Button("impact weight medium".capitalized) {
                            impactweightmedium += 1
                        }
                        .sensoryFeedback(.impact(weight: .medium, intensity: medium), trigger: impactweightmedium)
                        
                        Stepper(medium.formatted(), value: $medium, step: 0.1)
                    }
                    
                    HStack(spacing: 30) {
                        Button("impact weight heavy".capitalized) {
                            impactweightheavy += 1
                        }
                        .sensoryFeedback(.impact(weight: .heavy, intensity: heavy), trigger: impactweightheavy)
                        
                        Stepper(heavy.formatted(), value: $heavy, step: 0.1)
                    }
                }
                .border(Color.gray.opacity(0.5))
            }
            .scrollIndicators(.never)
            .padding(.horizontal)
            .buttonStyle(.bordered)
        } else {
            Text("SensoryFeedback available iOS 17+")
        }
    }
}

#Preview {
    SensoryFeedbacksView()
}
