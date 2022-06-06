//
//  WidgetLarge.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 13.10.2021.
//

import SwiftUI
import WidgetKit

struct WidgetLarge: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("USER's recent activity")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.stateGray)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)

                Spacer()
            }

            Link(destination: URL(string: "widget://activity=sleep")!) {
                ZStack {
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(Color.scooter)
                        
                        HStack(spacing: 10) {
                            Image(systemName: "star")
                                .font(.system(size: 24))
                            VStack(alignment: .leading, spacing: 2) {
                                Text("2h 50m ago")
                                    .font(.system(size: 20))
                                Text("30min")
                                    .font(.system(size: 13))
                            }
                                
                            Spacer()
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                    
                }
            }

            ZStack {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Color.burntSienna)
                Link(destination: URL(string: "widget://activity=nursing")!) {
                    VStack(alignment: .leading) {
                        Spacer()
                        HStack {
                            Text("Track Nursing")
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.bottom, 8)
                                .padding(.leading, 12)

                            Spacer()
                        }
                    }
                }
            }

            ZStack {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.citrine, Color.corn]),
                        startPoint: .top,
                        endPoint: .bottom))
                Link(destination: URL(string: "widget://activity=diaper")!) {
                    VStack(alignment: .leading) {
                        Image(systemName: "star")
                            .padding(.leading, 12)
                            .padding(.top, 10)
                        
                        Spacer()
                        HStack {
                            Text("Track Diaper")
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.bottom, 8)
                                .padding(.leading, 12)

                            Spacer()
                        }
                    }
                }
            }

            ZStack {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.jazzberryJam, Color.roseBudCherry]),
                        startPoint: .top,
                        endPoint: .bottom))
                Link(destination: URL(string: "widget://activity=solids")!) {
                    VStack(alignment: .leading) {
                        Image(systemName: "star")

                            .padding(.leading, 12)
                            .padding(.top, 10)
                        
                        Spacer()
                        HStack {
                            Text("Track Solids")
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.bottom, 8)
                                .padding(.leading, 12)

                            Spacer()
                        }
                    }
                }
            }
        }
        .padding(8)
        //        .redacted(reason: model.activity == .unknown ? .placeholder : [])
        //        .widgetURL(model.deepLinkURL)
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

#if DEBUG
struct WidgetLarge_Previews: PreviewProvider {
    static var previews: some View {
//        WidgetLarge()
//            .previewContext(WidgetPreviewContext(family: .systemLarge))
//            .environment(\.colorScheme, .light)
//            .previewDisplayName("SYSTEM")
//
//        WidgetLarge()
//            .previewContext(WidgetPreviewContext(family: .systemLarge))
//            .environment(\.colorScheme, .dark)
//            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
//            .previewDisplayName("iPhone 13 Pro Max")
        
//        LargeSweetSpotWidgetViewEntry()
//            .previewContext(WidgetPreviewContext(family: .systemLarge))
//            .environment(\.colorScheme, .light)
//            .previewDisplayName("iPhone 12 Pro Max")
//
//        LargeSweetSpotWidgetViewEntry()
//            .previewContext(WidgetPreviewContext(family: .systemLarge))
//            .environment(\.colorScheme, .light)
//            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
//            .previewDisplayName("iPhone 12")
        
        LargeLinksWidget()
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            .environment(\.colorScheme, .light)
            .previewDisplayName("iPhone 12 Pro Max")
        
        LargeLinksWidget()
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            .environment(\.colorScheme, .light)
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")
    }
}
#endif

struct LargeSweetSpotWidgetViewEntry: View {
    
//    @ObservedObject var model: SweetSpotWidgetViewModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            backgroundColor
            
            VStack(spacing: 0) {
                
                userInfoView
                
                Spacer(minLength: 0)
                
                HStack(alignment: .top, spacing: 17) {
                    
                    sleepView
                        .padding(.leading, 16)
                    
                    Divider()
                        .background(colorScheme == .light ? Color.lightGray : Color.white)
                        .frame(height: 127)
                    
                    nursingView
                        .padding(.leading, 2)
                        .padding(.trailing, 17)
                }
                .padding(.top, 14)
                
                Spacer()
                
                buttonsView
                    .padding(.bottom, 13)
            }
        }
    }
}


private extension LargeSweetSpotWidgetViewEntry {
    
    var backgroundColor: some View {
        colorScheme == .light ? Color.white : Color.eggPlant
    }
    
    @ViewBuilder
    var userInfoView: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading) {
                if 1 == 1 {
                    if 1 == 1,
                       1 != 1,
                       1 != 1 {
                        Text("text1")
                            .font(.system(size: 14, weight: .semibold))
                    } else {
                        Text("sweetSpotText.text1")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                        
                        Text("sweetSpotText.text2")
                            .font(.system(size: 36))
                            .fontWeight(.light)
//                            .lineLimit(1)
                        
                        Text("sweetSpotText.text3")
                            .font(.system(size: 14, weight: .semibold))
                    }
                } else {
                    Text("SweetSpot® near")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                    
                    Text("model.lastUseDay")
                        .font(.system(size: 36))
                        .fontWeight(.light)
                    
                    if 1 == 1 {
                        if Date(timeIntervalSinceNow: 1000) > Date() {
                            Text("in ")
                                .font(.system(size: 14))
                            +
                            Text(Date(timeIntervalSinceNow: 1000), style: .relative)
                                .font(.system(size: 14, weight: .semibold))
                        } else {
                            Text(Date(timeIntervalSinceNow: 1000), style: .relative)
                                .font(.system(size: 14, weight: .semibold))
                            +
                            Text(" ago")
                                .font(.system(size: 14))
                        }
                    }
                }
            }
//            .redacted(reason: model.userID == nil ? .placeholder : [])
            .padding(.leading, 18)
            .foregroundColor(.white)
            
            Spacer()
            
            VStack {
                userImage
                
                Text("userName".uppercased())
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.bottom, 4)
//                    .redacted(reason: model.userID == nil ? .placeholder : [])
            }
        }
        .padding(.top, 16)
        .padding(.trailing, 16)
        .padding(.bottom, 14)
        .ignoresSafeArea(.all)
        .background(Color.scooter)
//        .redacted(reason: model.userID == nil ? .placeholder : [])
    }
    
    @ViewBuilder
    var sleepView: some View {
        VStack(alignment: .center, spacing: 5) {
            Text("Sleep")
                .font(.system(size: 14, weight: .semibold))
//                .foregroundColor(colorScheme == .light ? .eastBay : .white)
            
//            Link(destination: model.deepLinkURL(activity: .sleep, source: "SweetSpotWidgetViewModel", timer: "true")) {
                VStack(spacing: 1 == 1 ? 5 : 8) {
                    Image(1 == 1 ? "pause" : "play")
                        .foregroundColor(.white)
                        .frame(width: 18, height: 18)

                    if 1 == 1 {
                        if 1 != 1 {
                            HStack(alignment: .center) {
                                Spacer()
                                Text(Date(timeIntervalSinceNow: -2000), style: .timer)
                                    .font(.system(size: 16, design: .rounded))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                        } else if 1 == 1 {
                            HStack(alignment: .center) {
                                Spacer()
                                Text("TimerPausedTime")
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
//            }
            
//            if let duration = model.lastSleepDuration, let lastSleepDate = model.lastSleepDate {
//                VStack(alignment: .center) {
//                    Text(lastSleepDate, style: .relative) +  Text("・")
//                    Text(duration)
//                }
//                .redacted(reason: model.userID == nil ? .placeholder : [])
//                .font(.system(size: 12))
//                .foregroundColor(colorScheme == .light ? .eastBay : .white)
//                .minimumScaleFactor(0.7)
//                .multilineTextAlignment(.center)
//            } else {
//                Spacer()
//            }
        }
    }
    
    @ViewBuilder
    var nursingView: some View {
        VStack(alignment: .center, spacing: 6) {
            Text("Nursing")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(colorScheme == .light ? .eastBay : .white)
            
            HStack(spacing: 18) {
                nursingLeftView
                nursingRightView
            }
            
            nursingStatView
        }
    }
    
    var nursingLeftView: some View {
//        Link(destination: model.deepLinkURL(activity: .nursing, source: "SweetSpotWidgetViewModel", timer: "true", breastSide: "left")) {
            ZStack(alignment: .top) {
                VStack(spacing: 1 == 1 ? 5 : 8) {
                    if 1 == 1 {
                        if !(1 == 1) {
                            Image("pause")
                                .foregroundColor(.white)
                                .frame(width: 18, height: 18)
                            Text(Date(timeIntervalSinceNow: 2000), style: .timer)
                                .font(.system(size: 16, design: .rounded))
                                .multilineTextAlignment(.center)
                        } else {
                            Image("play")
                                .foregroundColor(.white)
                                .frame(width: 18, height: 18)
                            Text("LEFT")
                                .font(.system(size: 10, weight: .bold))
                        }
                    } else {
                        Image("play")
                            .foregroundColor(.white)
                            .frame(width: 18, height: 18)
                        Text("LEFT")
                            .font(.system(size: 10, weight: .bold))
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
//        }
    }
    
    var nursingRightView: some View {
//        Link(destination: model.deepLinkURL(activity: .nursing, source: "SweetSpotWidgetViewModel", timer: "true", breastSide: "right")) {
            ZStack(alignment: .top) {
                VStack(spacing: 1 == 1 ? 5 : 8) {
                    if 1 == 1 {
                        if 1 != 1 {
                            Image("pause")
                                .foregroundColor(.white)
                                .frame(width: 18, height: 18)
                            Text(Date(timeIntervalSinceNow: 500), style: .timer)
                                .font(.system(size: 16, design: .rounded))
                                .multilineTextAlignment(.center)
                        } else {
                            Image("play")
                                .foregroundColor(.white)
                                .frame(width: 18, height: 18)
                            Text("RIGHT")
                                .font(.system(size: 10, weight: .bold))
                        }
                    } else {
                        Image("play")
                            .foregroundColor(.white)
                            .frame(width: 18, height: 18)
                        Text("RIGHT")
                            .font(.system(size: 10, weight: .bold))
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
                    .opacity(1 == 1 ? 1 : 0), alignment: .topTrailing)
//        }
    }
    
    var nursingStatView: some View {
        HStack(spacing: 2) {
            
//            if let lastFeedDate = model.lastFeedDate {
                Group {
                    Text(Date(timeIntervalSinceNow: 200), style: .relative)
                    +
                    Text("・")
                }
                .lineLimit(1)
//                .redacted(reason: model.userID == nil ? .placeholder : [])
                .minimumScaleFactor(0.8)
                .multilineTextAlignment(.trailing)
//            }
                        
            ZStack(alignment: .center) {
                Circle()
                    .fill(Color.burntSienna)
                    .frame(width: 13, height: 13)
                
                Text("L")
                    .font(.system(size: 10))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
            }
            
            Text("2")
//                .redacted(reason: model.userID == nil ? .placeholder : [])
            
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
            
            Text("8")
//                .redacted(reason: model.userID == nil ? .placeholder : [])
        }
        .font(.system(size: 12))
        .foregroundColor(colorScheme == .light ? .eastBay : .white)
        .frame(width: 170, alignment: .trailing)
    }
    
    var buttonsView: some View {
        HStack(spacing: 24) {
//            Link(destination: model.deepLinkURL(activity: .nursing, source: "SweetSpotWidgetViewModel", timer: "false")) {
                ZStack {
                    colorScheme == .light ? Color.white : Color.magentaLight

                    Circle()
                        .strokeBorder(colorScheme == .light ? Color.lightGray : Color.magentaLight, lineWidth: 1)

                    Image("feed")
                        .foregroundColor(colorScheme == .light ? .burntSienna : .white)
                        .frame(width: 32, height: 32)
                }
                .frame(width: 52, height: 52)
                .clipShape(Circle())
//            }

//            Link(destination: model.deepLinkURL(activity: .solids, source: "SweetSpotWidgetViewModel", timer: "false")) {
//                ZStack {
//                    colorScheme == .light ? Color.white : Color.jazzberryJam
//
//                    Circle()
//                        .strokeBorder(colorScheme == .light ? Color.lightGray : Color.jazzberryJam, lineWidth: 1)
//
//                    Image("solids")
//                        .foregroundColor(colorScheme == .light ? .jazzberryJam : .white)
//                        .frame(width: 32, height: 32)
//                }
//                .frame(width: 52, height: 52)
//                .clipShape(Circle())
//            }
//
//            Link(destination: model.deepLinkURL(activity: .diaper, source: "SweetSpotWidgetViewModel", timer: "false")) {
//                ZStack {
//                    colorScheme == .light ? Color.white : Color.corn
//
//                    Circle()
//                        .strokeBorder(colorScheme == .light ? Color.lightGray : Color.corn, lineWidth: 1)
//
//                    Image("diaper")
//                        .foregroundColor(colorScheme == .light ? .corn : .white)
//                        .frame(width: 32, height: 32)
//                }
//                .frame(width: 52, height: 52)
//                .clipShape(Circle())
//            }
//
//            Link(destination: model.deepLinkURL(activity: .pumping, source: "SweetSpotWidgetViewModel", timer: "false")) {
//                ZStack {
//                    colorScheme == .light ? Color.white : Color.violaFlover
//
//                    Circle()
//                        .strokeBorder(colorScheme == .light ? Color.lightGray : Color.violaFlover, lineWidth: 1)
//
//                    Image("pumping")
//                        .foregroundColor(colorScheme == .light ? .violaFlover : .white)
//                        .frame(width: 32, height: 32)
//                }
//                .frame(width: 52, height: 52)
//                .clipShape(Circle())
//            }
        }
    }

    @ViewBuilder
    var userImage: some View {
        Circle()
            .frame(width: 72, height: 72)
            .foregroundColor(.green)
            .overlay(
                Image("logo")
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    .unredacted(),
                alignment: .bottomTrailing
            )
    }
}


struct LargeLinksWidget: View {
    
//    @ObservedObject var model: LinksWidgetViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
            VStack(spacing: 8) {
                HStack {
                    Text("Clint's recent activity")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(colorScheme == .light ? Color.stateGray : .white)
                    
                    Spacer()
                    Image("logo").resizable()
                        .frame(width: 24, height: 24)
                        .padding(.trailing, 2)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 3)
                .padding(.top, 6)
                
                    ZStack {
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [Color.jazzberryJam, Color.roseBudCherry]),
                                startPoint: .top,
                                endPoint: .bottom))
                        
                        HStack(spacing: 14) {
                            Image("solids")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                                .frame(width: 24, height: 24)
                            
                            if 1 == 1 {
                                VStack(alignment: .leading, spacing: 2) {
                                    Group {
                                        Text(Date(), style: .relative)
                                        +
                                        Text(" ago")
                                    }
                                    .font(.system(size: 20))
                                    
                                    Text("Avocado")
                                        .font(.system(size: 13, weight: .medium, design: .rounded))
                                        .lineLimit(1)
                                        .truncationMode(.tail)
                                }
                            }
                            
                            Spacer()
                            
                            Image("plus")
                                .foregroundColor(.white)
                                .frame(width: 24, height: 24)
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                    }
                    .frame(maxHeight: 100)
                            Spacer()
//                ZStack {
//                    RoundedRectangle(cornerRadius: 14, style: .continuous)
//                        .fill(LinearGradient(
//                            gradient: Gradient(colors: [Color.jazzberryJam, Color.roseBudCherry]),
//                            startPoint: .top,
//                            endPoint: .bottom))
//
//                    HStack(spacing: 14) {
//                        Image("solids")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .foregroundColor(.white)
//                            .frame(width: 24, height: 24)
//
//                        if 1 == 1 {
//                            VStack(alignment: .leading, spacing: 2) {
//                                Group {
//                                    Text(Date(), style: .relative)
//                                    +
//                                    Text(" ago")
//                                }
//                                .font(.system(size: 20))
//
//                                Text("Avocado")
//                                    .font(.system(size: 13, weight: .medium, design: .rounded))
//                                    .lineLimit(1)
//                                    .truncationMode(.tail)
//                            }
//                        }
//
//                        Spacer()
//
//                        Image("plus")
//                            .foregroundColor(.white)
//                            .frame(width: 24, height: 24)
//                    }
//                    .foregroundColor(.white)
//                    .padding(.horizontal, 16)
//                }
                
//                Spacer(minLength: 0)
            }
            .padding(8)
//        .redacted(reason: model.userID == nil ? .placeholder : [])
        
        
    }
    
    private var backgroundColor: some View {
        colorScheme == .light ? Color.white : Color.eggPlant
    }
}
