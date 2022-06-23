//
//  TimersMediumWidgetEntryView.swift
//  StaticWidgetsExtension
//
//  Created by Viktor Berezhnytskyi on 21.06.2022.
//

import SwiftUI
import WidgetKit

struct TimersMediumWidgetEntryView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            backgroundColor
                .overlay(Image("logo").padding(10), alignment: .topTrailing)
            
            HStack(alignment: .top, spacing: 17) {
                
                sleepView
                    .padding(.leading, 22)
                
                Divider()
                    .background(colorScheme == .light ? Color.lightGray : Color.white)
                    .frame(height: 127)
                
                nursingView
                    .padding(.leading, 2)
                    .padding(.trailing, 17)
            }
            .padding(.top)
        }
    }
    
    private var backgroundColor: some View {
        colorScheme == .light ? Color.white : Color.eggPlant
    }
    
    private var sleepView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Sleep")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(colorScheme == .light ? .eastBay : .white)
            Link(destination: URL(string: "www.google.com")!) {
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
                .foregroundColor(Color.white)
                .frame(width: 80, height: 80)
                .background(Color.scooter)
                .clipShape(Circle())
            }
            
            
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
    }
    
    var nursingView: some View {
        VStack(alignment: .center, spacing: 6) {
            HStack(spacing: 18) {
                nursingLeftView
                nursingRightView
            }
            nursingStatView
        }
    }
    
    var nursingLeftView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Nursing")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(colorScheme == .light ? .eastBay : .white)
            
            Link(destination: URL(string: "www.google.com")!) {
                ZStack(alignment: .top) {
                    VStack(spacing: 1 == 1 ? 5 : 8) {
                        if 1 == 1 {
                            if (1 == 1 && 1 == 1) {
                                Image(1 == 1 ? "pause" : "play")
                                    .foregroundColor(.white)
                                    .frame(width: 18, height: 18)
                                Text(Date(), style: .timer)
                                    .font(.system(size: 16, design: .rounded))
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                    .font(.system(size: 16))
                    .foregroundColor(Color.white)
                    .frame(width: 80, height: 80)
                    .background(Color.burntSienna)
                    .clipShape(Circle())
                }
                .overlay(
                    Circle()
                        .fill(Color.lynch)
                        .frame(width: 20, height: 20)
                        .overlay(
                            Text("LS")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.white)
                        )
                        .opacity(1 == 1 ? 1 : 0), alignment: .topLeading)
            }
        }
    }
    
    var nursingRightView: some View {
        VStack(alignment: .center, spacing: 5) {
                Text("123456".uppercased())
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(colorScheme == .light ? .eastBay : .white)
                    .fixedSize()
                    .lineLimit(0)
                    .border(Color.green, width: 1)
            
            
//            Link(destination: URL(string: "www.google.com")!) {
                ZStack(alignment: .top) {
                    VStack(spacing: 1 == 1 ? 5 : 8) {
                        if 1 == 1 {
                            if 1 == 1 {
                                Image("pause")
                                    .foregroundColor(.white)
                                    .frame(width: 18, height: 18)
                                
                                Text(Date(), style: .timer)
                                    .font(.system(size: 16, design: .rounded))
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                    .font(.system(size: 16))
                    .foregroundColor(Color.white)
                    .frame(width: 80, height: 80)
                    .background(Color.burntSienna)
                    .clipShape(Circle())
                }
                .overlay(
                    Circle()
                        .fill(Color.lynch)
                        .frame(width: 24, height: 24)
                        .overlay(
                            Text("LS")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.white)
                        )
                        .opacity(1 != 1 ? 1 : 0), alignment: .topTrailing)
//            }
        }
        .border(Color.red, width: 1)
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
struct TimersMediumWidgetEntryView_Previews: PreviewProvider {
    static var previews: some View {
        TimersMediumWidgetEntryView()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
#endif
