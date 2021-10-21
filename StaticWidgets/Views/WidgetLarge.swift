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
        WidgetLarge()
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            .environment(\.colorScheme, .light)
            .previewDisplayName("SYSTEM")
            
        WidgetLarge()
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            .environment(\.colorScheme, .dark)
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .previewDisplayName("iPhone 13 Pro Max")
    }
}
#endif


/*
 import SwiftUI
 import WidgetKit

 struct WidgetLarge: View {
     
     @Environment(\.colorScheme) var colorScheme
     
     var body: some View {
         ZStack {
             backgroundColor
             
             VStack(spacing: 8) {

                 userInfoView

                 HStack(alignment: .top, spacing: 8) {
                     
                     sleepView
                         .padding(.trailing, 8)

                     Divider().background(colorScheme == .light ? Color.lightGray : Color.white)

                     nursingView
                 }
                 .padding(.top, 18)
                 
                 buttonsView
                 .padding()
             }
         }
         //.redacted(reason: model.username.isEmpty ? .placeholder : [])
         //        .widgetURL(model.deepLinkURL)
     }
 }

 private extension WidgetLarge {
     
     private var backgroundColor: some View {
         colorScheme == .light ? Color.white : Color.eggPlant
     }
     
     @ViewBuilder
     var userInfoView: some View {
         HStack(spacing: 8) {

             VStack(alignment: .leading) {
                 Text("SweetSpot® In")
                     .font(.system(size: 15))
                     .fontWeight(.medium)

                 Text("2h 50m")
                     .font(.system(size: 28))
                     .fontWeight(.light)

                 Text("Naptime near 3:00pm")
                     .font(.system(size: 13))
             }
             .padding(.leading, 18)
             .foregroundColor(.white)

             Spacer()

             VStack {
                 Circle()
                     .frame(width: 64, height: 64)
                     .foregroundColor(.orange)
                     .overlay(alignment: .bottomTrailing) {
                         Image("logo_white")
                             .resizable()
                             .frame(width: 18, height: 18)
                     }
                 Text("model.username")
                     .font(.system(size: 14))
                     .fontWeight(.semibold)
                     .foregroundColor(.white)
 //                    .padding(.bottom, 4)
             }
         }
         .padding(.top, 16)
         .padding(.trailing, 16)
         .padding(.bottom, 20)
         .ignoresSafeArea(.all)
         .background(Color.scooter)
 //        .redacted(reason: 1 == 1 ? .placeholder : [])
     }

     @ViewBuilder
     var sleepView: some View {
         VStack(spacing: 5) {
             HStack {
                 Text("Sleep")
                     .font(.system(size: 14))
                     .fontWeight(.semibold)
                     .foregroundColor(colorScheme == .light ? .eastBay : .white)
             }

             Link(destination: URL(string: "widget://activity=sleep")!) {
                 VStack(spacing: 10) {

                     Image(systemName: true ? "pause.fill" : "play.fill")

                     if true {
                         HStack(alignment: .center) {
                             Spacer()
                             Text(Date(timeIntervalSince1970: 0), style: .timer)
                                 .multilineTextAlignment(.center)
                             Spacer()
                         }
                     } else {
                         Text("00:00")
                     }
                 }
                 .font(.system(size: 16))
                 .foregroundColor(Color.white)
                 .frame(width: 80, height: 80)
                 .background(Color.scooter)
                 .clipShape(Circle())
             }

             if 1 == 1 {
                 VStack {
                     Text("duration・")
                         .fontWeight(.semibold)
                     
                     Text("lastSleepDate")
                 }
                 .font(.system(size: 12))
                 .foregroundColor(colorScheme == .light ? .eastBay : .white)
             } else {
                 Spacer()
             }
         }
     }

     @ViewBuilder
     var nursingView: some View {
         VStack(spacing: 5) {
             HStack {
                 Text("Nursing")
                     .font(.system(size: 14))
                     .fontWeight(.semibold)
                     .foregroundColor(colorScheme == .light ? .eastBay : .white)
             }

             HStack(spacing: 20) {
                 Link(destination: URL(string: "widget://activity=nursing")!) {
                     ZStack(alignment: .top) {
                         VStack(spacing: 10) {

                             Image(systemName: true ? "pause.fill" : "play.fill")

                             if true {
                                 HStack(alignment: .center) {
                                     Spacer()
                                     Text(Date(timeIntervalSince1970: 0), style: .timer)
                                         .multilineTextAlignment(.center)
                                     Spacer()
                                 }
                             } else {
                                 Text("Left")
                             }
                         }
                         .font(.system(size: 16))
                         .foregroundColor(Color.white)
                         .frame(width: 80, height: 80)
                         .background(Color.burntSienna)
                         .clipShape(Circle())
                     }
                 }

                 Link(destination: URL(string: "widget://activity=nursing")!) {
                     ZStack(alignment: .top) {
                         VStack(spacing: 10) {
                             Image(systemName: true ? "pause.fill" : "play.fill")

                             if true {
                                 HStack(alignment: .center) {
                                     Spacer()
                                     Text(Date(timeIntervalSince1970: 0), style: .timer)
                                         .multilineTextAlignment(.center)
                                     Spacer()
                                 }
                             } else {
                                 Text("Right")
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
                             ), alignment: .topTrailing)
                 }
             }

             nursingStatView
         }
         .padding(.leading, 15)
     }

     @ViewBuilder
     var nursingStatView: some View {
         HStack(spacing: 2) {
             Text("1d ago・")
             
             ZStack(alignment: .center) {
                 Circle()
                     .fill(Color.burntSienna)
                     .frame(width: 13, height: 13)
                 
                 Text("L")
                     .font(.system(size: 10))
                     .fontWeight(.semibold)
                     .foregroundColor(Color.white)
             }
             
             Text("7m")
                 .fontWeight(.semibold)
             
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
             
             Text("7m")
                 .fontWeight(.semibold)
         }
         .font(.system(size: 12))
         .foregroundColor(colorScheme == .light ? .eastBay : .white)
     }
     
     var buttonsView: some View {
         HStack(spacing: 30) {
             ZStack {
                 colorScheme == .light ? Color.white : Color.magentaLight
                 
                 Circle()
                     .strokeBorder(colorScheme == .light ? Color.lightGray : Color.magentaLight, lineWidth: 1)
                 
                 Image(systemName: "moon")
                     .font(.system(size: 28))
                     .foregroundColor(colorScheme == .light ? Color.burntSienna : Color.white)
             }
             .frame(width: 54, height: 54)
             .clipShape(Circle())
             
             ZStack {
                 colorScheme == .light ? Color.white : Color.jazzberryJam
                 
                 Circle()
                     .strokeBorder(colorScheme == .light ? Color.lightGray : Color.jazzberryJam, lineWidth: 1)
                 
                 Image(systemName: "moon")
                     .font(.system(size: 28))
                     .foregroundColor(colorScheme == .light ? Color.jazzberryJam : Color.white)
             }
             .frame(width: 54, height: 54)
             .clipShape(Circle())

             Link(destination:
                     DeepLinkBuilder()
                     .cid("model.userID")
                     .activity("sleep")
                     .build()
             ) {
             ZStack {
                 colorScheme == .light ? Color.white : Color.corn
                 
                 Circle()
                     .strokeBorder(colorScheme == .light ? Color.lightGray : Color.corn, lineWidth: 1)
                 
                 Image(systemName: "moon")
                     .font(.system(size: 28))
                     .foregroundColor(colorScheme == .light ? Color.corn : Color.white)
             }
             .frame(width: 54, height: 54)
             .clipShape(Circle())
         }

             ZStack {
                 colorScheme == .light ? Color.white : Color.violaFlover
                 
                 Circle()
                     .strokeBorder(colorScheme == .light ? Color.lightGray : Color.violaFlover, lineWidth: 1)
                 
                 Image(systemName: "moon")
                     .font(.system(size: 28))
                     .foregroundColor(colorScheme == .light ? Color.violaFlover : Color.white)
             }
             .frame(width: 54, height: 54)
             .clipShape(Circle())
         }
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
         WidgetLarge()
             .previewContext(WidgetPreviewContext(family: .systemLarge))
             .environment(\.colorScheme, .light)
             
         WidgetLarge()
             .previewContext(WidgetPreviewContext(family: .systemLarge))
             .environment(\.colorScheme, .dark)
             .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))

     }
 }
 #endif

 */



// With autoLayout for all iphones

/*
 import SwiftUI
 import WidgetKit

 struct WidgetLarge: View {
     
     @Environment(\.colorScheme) var colorScheme
     
     var body: some View {
         ZStack {
             backgroundColor
             VStack {
                 header
                 Spacer()
                 center
                 Spacer()
                 buttonsView
                     .padding(.horizontal, 25)
                     .padding(.bottom)
             }
         }
     }
     
     var header: some View {
         VStack {
             HStack(spacing: 8) {
                 VStack(alignment: .leading) {
                     Text("SweetSpot® In")
                         .font(.system(size: 15))
                         .fontWeight(.medium)
                     
                     Text("2h 50m")
                         .font(.system(size: 28))
                         .fontWeight(.light)
                     
                     Text("Naptime near 3:00pm")
                         .font(.system(size: 13))
                 }
                 .foregroundColor(.white)
                 
                 Spacer()
                 
                 VStack {
                     Circle()
                         .frame(width: 72, height: 72)
                         .foregroundColor(.orange)
                         .overlay(alignment: .bottomTrailing) {
                             Image("logo_white")
                                 .resizable()
                                 .frame(width: 18, height: 18)
                         }
                     Text("model.username")
                         .font(.system(size: 14))
                         .fontWeight(.semibold)
                         .foregroundColor(.white)
                 }
             }
             .padding(.horizontal)
         }
         .background(Color.scooter)
     }
     
     var center: some View {
         HStack(alignment: .top, spacing: 10) {
             
             sleepView
             
             Divider()
                 .background(colorScheme == .light ? Color.lightGray : Color.white)
                 .frame(height: 130)
             nursingView
         }
     }
 }

 private extension WidgetLarge {
     
     private var backgroundColor: some View {
         colorScheme == .light ? Color.white : Color.eggPlant
     }
     
     @ViewBuilder
     var userInfoView: some View {
         HStack(spacing: 8) {

             VStack(alignment: .leading) {
                 Text("SweetSpot® In")
                     .font(.system(size: 15))
                     .fontWeight(.medium)

                 Text("2h 50m")
                     .font(.system(size: 28))
                     .fontWeight(.light)

                 Text("Naptime near 3:00pm")
                     .font(.system(size: 13))
             }
             .padding(.leading, 18)
             .foregroundColor(.white)

             Spacer()

             VStack {
                 Circle()
                     .frame(width: 64, height: 64)
                     .foregroundColor(.orange)
                     .overlay(alignment: .bottomTrailing) {
                         Image("logo_white")
                             .resizable()
                             .frame(width: 18, height: 18)
                     }
                 Text("model.username")
                     .font(.system(size: 14))
                     .fontWeight(.semibold)
                     .foregroundColor(.white)
             }
         }
         .padding(.top, 16)
         .padding(.trailing, 16)
         .padding(.bottom, 20)
         .ignoresSafeArea(.all)
         .background(Color.scooter)
     }

     @ViewBuilder
     var sleepView: some View {
         VStack(spacing: 5) {
             HStack {
                 Text("Sleep")
                     .font(.system(size: 14))
                     .fontWeight(.semibold)
                     .foregroundColor(colorScheme == .light ? .eastBay : .white)
             }

             Link(destination: URL(string: "widget://activity=sleep")!) {
                 VStack(spacing: 10) {

                     Image(systemName: true ? "pause.fill" : "play.fill")

                     if true {
                         HStack(alignment: .center) {
                             Spacer()
                             Text(Date(timeIntervalSince1970: 0), style: .timer)
                                 .multilineTextAlignment(.center)
                             Spacer()
                         }
                     } else {
                         Text("00:00")
                     }
                 }
                 .font(.system(size: 16))
                 .foregroundColor(Color.white)
                 .frame(width: 80, height: 80)
                 .background(Color.scooter)
                 .clipShape(Circle())
             }

             if 1 == 1 {
                 VStack {
                     Text("duration・")
                         .fontWeight(.semibold)
                     
                     Text("lastSleepDate")
                 }
                 .font(.system(size: 12))
                 .foregroundColor(colorScheme == .light ? .eastBay : .white)
             } else {
                 Spacer()
             }
         }
     }

     @ViewBuilder
     var nursingView: some View {
         VStack(spacing: 5) {
             HStack {
                 Text("Nursing")
                     .font(.system(size: 14))
                     .fontWeight(.semibold)
                     .foregroundColor(colorScheme == .light ? .eastBay : .white)
             }

             HStack(spacing: 20) {
                 Link(destination: URL(string: "widget://activity=nursing")!) {
                     ZStack(alignment: .top) {
                         VStack(spacing: 10) {

                             Image(systemName: true ? "pause.fill" : "play.fill")

                             if true {
                                 HStack(alignment: .center) {
                                     Spacer()
                                     Text(Date(timeIntervalSince1970: 0), style: .timer)
                                         .multilineTextAlignment(.center)
                                     Spacer()
                                 }
                             } else {
                                 Text("Left")
                             }
                         }
                         .font(.system(size: 16))
                         .foregroundColor(Color.white)
                         .frame(width: 80, height: 80)
                         .background(Color.burntSienna)
                         .clipShape(Circle())
                     }
                 }

                 Link(destination: URL(string: "widget://activity=nursing")!) {
                     ZStack(alignment: .top) {
                         VStack(spacing: 10) {
                             Image(systemName: true ? "pause.fill" : "play.fill")

                             if true {
                                 HStack(alignment: .center) {
                                     Spacer()
                                     Text(Date(timeIntervalSince1970: 0), style: .timer)
                                         .multilineTextAlignment(.center)
                                     Spacer()
                                 }
                             } else {
                                 Text("Right")
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
                             ), alignment: .topTrailing)
                 }
             }

             nursingStatView
         }
     }

     @ViewBuilder
     var nursingStatView: some View {
         HStack(spacing: 2) {
             Text("1d ago・")
             
             ZStack(alignment: .center) {
                 Circle()
                     .fill(Color.burntSienna)
                     .frame(width: 13, height: 13)
                 
                 Text("L")
                     .font(.system(size: 10))
                     .fontWeight(.semibold)
                     .foregroundColor(Color.white)
             }
             
             Text("7m")
                 .fontWeight(.semibold)
             
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
             
             Text("7m")
                 .fontWeight(.semibold)
         }
         .font(.system(size: 12))
         .foregroundColor(colorScheme == .light ? .eastBay : .white)
     }
     
     var buttonsView: some View {
         HStack {
             ZStack {
                 colorScheme == .light ? Color.white : Color.magentaLight
                 
                 Circle()
                     .strokeBorder(colorScheme == .light ? Color.lightGray : Color.magentaLight, lineWidth: 1)
                 
                 Image(systemName: "moon")
                     .font(.system(size: 28))
                     .foregroundColor(colorScheme == .light ? Color.burntSienna : Color.white)
             }
             .frame(width: 52, height: 52)
             .clipShape(Circle())
             
             Spacer()
             
             ZStack {
                 colorScheme == .light ? Color.white : Color.jazzberryJam
                 
                 Circle()
                     .strokeBorder(colorScheme == .light ? Color.lightGray : Color.jazzberryJam, lineWidth: 1)
                 
                 Image(systemName: "moon")
                     .font(.system(size: 28))
                     .foregroundColor(colorScheme == .light ? Color.jazzberryJam : Color.white)
             }
             .frame(width: 52, height: 52)
             .clipShape(Circle())

             Spacer()
             
             Link(destination:
                     DeepLinkBuilder()
                     .cid("model.userID")
                     .activity("sleep")
                     .build()
             ) {
             ZStack {
                 colorScheme == .light ? Color.white : Color.corn
                 
                 Circle()
                     .strokeBorder(colorScheme == .light ? Color.lightGray : Color.corn, lineWidth: 1)
                 
                 Image(systemName: "moon")
                     .font(.system(size: 28))
                     .foregroundColor(colorScheme == .light ? Color.corn : Color.white)
             }
             .frame(width: 52, height: 52)
             .clipShape(Circle())
         }

             Spacer()
             
             ZStack {
                 colorScheme == .light ? Color.white : Color.violaFlover
                 
                 Circle()
                     .strokeBorder(colorScheme == .light ? Color.lightGray : Color.violaFlover, lineWidth: 1)
                 
                 Image(systemName: "moon")
                     .font(.system(size: 28))
                     .foregroundColor(colorScheme == .light ? Color.violaFlover : Color.white)
             }
             .frame(width: 52, height: 52)
             .clipShape(Circle())
         }
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
         WidgetLarge()
             .previewContext(WidgetPreviewContext(family: .systemLarge))
             .environment(\.colorScheme, .light)
             .previewDisplayName("SYSTEM")
             
         WidgetLarge()
             .previewContext(WidgetPreviewContext(family: .systemLarge))
             .environment(\.colorScheme, .dark)
             .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
             .previewDisplayName("iPhone 13 Pro Max")
     }
 }
 #endif
 */
