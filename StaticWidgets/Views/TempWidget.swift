//
//  TempWidget.swift
//  StaticWidgetsExtension
//
//  Created by Viktor Berezhnytskyi on 21.06.2022.
//

import SwiftUI
import WidgetKit

struct TempWidget: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    private var backgroundColor: some View {
        colorScheme == .light ? Color.white : Color.eggPlant
    }
    
    var body: some View {
        ZStack {
            backgroundColor
                .overlay(Image("logo").padding(10), alignment: .topTrailing)
            
            HStack(alignment: .top, spacing: 16) {
                sleepView
                
                Divider()
                    .background(colorScheme == .light ? Color.lightGray : Color.white)
                    .frame(height: 127)
                
                nursingView
            }
            .padding(.top)
        }
    }
    
    private var sleepView: some View {
        VStack(alignment: .center, spacing: 5) {
            Text("Sleep")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(colorScheme == .light ? .eastBay : .white)
                .frame(width: 90, alignment: .leading)
            
            ZStack {
                Color.scooter
                
                VStack(spacing: 8) {
                    Image(1 == 1 ? "pause" : "play")
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                    
                    if 1 == 1 {
                        if 1 == 1 {
                            HStack(alignment: .center) {
                                Spacer()
                                Text(Date(), style: .timer)
                                    .font(.system(size: 16, design: .rounded))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                        }
                    } else {
                        Text("START")
                            .font(.system(size: 10, weight: .bold))
                    }
                }
                .font(.system(size: 16))
                .foregroundColor(.white)
            }
            .frame(width: 80, height: 80, alignment: .center)
            .clipShape(Circle())
            
            VStack(alignment: .center) {
                Text(Date(), style: .relative) +  Text("・")
                Text("duration")
            }
            .font(.system(size: 12))
            .foregroundColor(colorScheme == .light ? .eastBay : .white)
            .minimumScaleFactor(0.7)
            .multilineTextAlignment(.center)
            .layoutPriority(0)
        }
        .frame(width: 90)
    }
    
    var nursingView: some View {
        VStack(alignment: .center, spacing: 6) {
            HStack(spacing: 7) {
                nursingLeftView
                nursingRightView
            }
            nursingStatView
        }
    }
    
    private var nursingLeftView: some View {
        VStack(alignment: .center, spacing: 5) {
            Text("Nursing")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(colorScheme == .light ? .eastBay : .white)
                .frame(width: 90, alignment: .leading)
            
            ZStack {
                Color.burntSienna
                
                VStack(spacing: 8) {
                    Image(1 == 1 ? "pause" : "play")
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                    
                    if 1 == 1 {
                        if 1 == 1 {
                            HStack(alignment: .center) {
                                Spacer()
                                Text(Date(), style: .timer)
                                    .font(.system(size: 16, design: .rounded))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                        }
                    } else {
                        Text("START")
                            .font(.system(size: 10, weight: .bold))
                    }
                }
                .font(.system(size: 16))
                .foregroundColor(.white)
            }
            .frame(width: 80, height: 80, alignment: .center)
            .clipShape(Circle())
        }
    }
    
    private var nursingRightView: some View {
        VStack(alignment: .center, spacing: 5) {
            Text("josejo".uppercased())
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(colorScheme == .light ? .eastBay : .white)
                .frame(width: 90, alignment: .center)
            
            ZStack {
                Color.burntSienna
                
                VStack(spacing: 8) {
                    Image(1 == 1 ? "pause" : "play")
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                    
                    if 1 == 1 {
                        if 1 == 1 {
                            HStack(alignment: .center) {
                                Spacer()
                                Text(Date(), style: .timer)
                                    .font(.system(size: 16, design: .rounded))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                        }
                    } else {
                        Text("START")
                            .font(.system(size: 10, weight: .bold))
                    }
                }
                .font(.system(size: 16))
                .foregroundColor(.white)
            }
            .frame(width: 80, height: 80, alignment: .center)
            .clipShape(Circle())
        }
    }
    
    var nursingStatView: some View {
        HStack(spacing: 2) {
                Group {
                    Text(Date(), style: .relative)
                    +
                    Text("・")
                }
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .multilineTextAlignment(.trailing)
            
            ZStack(alignment: .center) {
                Circle()
                    .fill(Color.burntSienna)
                    .frame(width: 13, height: 13)
                
                Text("L")
                    .font(.system(size: 10))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
            }
            
            Text("5m")
            
            ZStack(alignment: .center) {
                Circle()
                    .fill(Color.burntSienna)
                    .frame(width: 13, height: 13)
                
                Text("R")
                    .font(.system(size: 10))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
            }
            .padding(.leading, 5)
            
            Text("3m")
        }
        .font(.system(size: 12))
        .foregroundColor(colorScheme == .light ? .eastBay : .white)
        .frame(width: 170, alignment: .trailing)
    }
}

#if DEBUG
struct TempWidget_Previews: PreviewProvider {
    static var previews: some View {
        TempWidget()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
#endif
