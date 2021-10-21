//
//  WidgetMedium.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 13.10.2021.
//

import SwiftUI
import WidgetKit

struct WidgetMedium: View {
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            backgroundColor
                .overlay(Image("logo").padding(10), alignment: .topTrailing)

            HStack(alignment: .top, spacing: 8) {
                
                sleepView
                    .padding(.trailing, 8)

                Divider().background(colorScheme == .light ? Color.lightGray : Color.white)

                nursingView
            }
            .padding(.top)
        }
    }

    private var backgroundColor: some View {
        colorScheme == .light ? Color.white : Color.eggPlant
    }

    private var sleepView: some View {
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

    private var nursingView: some View {
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
}

#if DEBUG
struct WidgetMedium_Previews: PreviewProvider {
    static var previews: some View {
        WidgetMedium()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            .environment(\.colorScheme, .light)
        WidgetMedium()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            .environment(\.colorScheme, .dark)
    }
}
#endif

//  Huckleberry SweetspotMediumWidgetEntryView
/*
 import SwiftUI
 import WidgetKit

 struct WidgetMedium: View {
 
 @Environment(\.colorScheme) var colorScheme

 var body: some View {
     ZStack {
         backgroundColor
             .overlay(Image("logo").padding(14), alignment: .topTrailing)

         VStack(alignment: .leading) {
             HStack {
                 Image(systemName: "moon")
                     .resizable()
                     .frame(width: 40, height: 40)
                     .foregroundColor(.scooter)

                 VStack(alignment: .leading, spacing: 5) {
                     Text("Henry slept")
                         .font(.system(size: 13, weight: .light))
                     Text("10h 50m ago")
                         .font(.system(size: 20, weight: .light))
                     Text("for 2h 30m")
                         .font(.system(size: 13, weight: .light))
                 }
                 .redacted(reason: 1 != 1 ? .placeholder : [])
                 .foregroundColor(colorScheme == .light ? .eastBay : .white)
             }
             HStack(spacing: 30) {
                 Circle()
                     .fill(Color.scooter)
                     .frame(width: 54, height: 54)
                     .overlay(
                         Image(systemName: "moon")
                             .font(.system(size: 28))
                             .foregroundColor(.white)
                     )

                 Circle()
                     .fill(Color.burntSienna)
                     .frame(width: 54, height: 54)
                     .overlay(
                         Image(systemName: "drop")
                             .font(.system(size: 28))
                             .foregroundColor(.white)
                     )

                 Circle()
                     .fill(Color.corn)
                     .frame(width: 54, height: 54)
                     .overlay(
                         Image(systemName: "star")
                             .font(.system(size: 28))
                             .foregroundColor(.white)
                     )

                 Circle()
                     .fill(Color.jazzberryJam)
                     .frame(width: 54, height: 54)
                     .overlay(
                         Image(systemName: "cloud")
                             .font(.system(size: 28))
                             .foregroundColor(.white)
                     )
             }
         }
     }
 }

 private var backgroundColor: some View {
     colorScheme == .light ? Color.white : Color.eggPlant
 }
}

 #if DEBUG
 struct WidgetMedium_Previews: PreviewProvider {
     static var previews: some View {
         WidgetMedium()
             .previewContext(WidgetPreviewContext(family: .systemMedium))
     }
 }
 #endif

 */


//  Huckleberry SweetspotMediumWidgetEntryView
/*
 import SwiftUI
 import WidgetKit

 struct WidgetMedium: View {

     @Environment(\.colorScheme) var colorScheme

     var body: some View {
         ZStack {
             backgroundColor
                 .overlay(Image("logo").padding(14), alignment: .topTrailing)

             HStack(alignment: .center, spacing: 22) {
                 sleepView
                     .padding(.top)

                 Divider()
                     .padding(.vertical)

                 nursingLeftView
                 nursingRightView
             }
         }
     }

     private var backgroundColor: some View {
         colorScheme == .light ? Color.white : Color.eggPlant
     }

     private var sleepView: some View {
         VStack(alignment: .leading) {
             Text("Sleep")
                 .foregroundColor(colorScheme == .light ? .eastBay : .white)
                 .font(.system(size: 14, weight: .medium))

             Link(destination: URL(string: "URL")!) {
                 Circle()
                     .fill(Color.scooter)
                     .frame(width: 79, height: 79)
                     .overlay(
                         VStack(spacing: 5) {
                             Image(systemName: "play.fill")
                                 .font(.system(size: 18))
                             Text("START")
                                 .font(.system(size: 10, weight: .bold))
                         }
                             .foregroundColor(.white)
                     )
             }

             VStack(alignment: .center) {
                 Text("10h 50m ago ◦")
                 Text("2h 30m")
             }
             .fixedSize()
             .foregroundColor(colorScheme == .light ? .eastBay : .white)
             .font(.system(size: 12, weight: .light))
         }
     }

     private var nursingLeftView: some View {
         VStack(alignment: .leading) {
             Text("Nursing")
                 .foregroundColor(colorScheme == .light ? .eastBay : .white)
                 .font(.system(size: 14, weight: .medium))

             Link(destination: URL(string: "URL")!) {
                 Circle()
                     .fill(Color.burntSienna)
                     .frame(width: 79, height: 79)
                     .overlay(
                         VStack(spacing: 5) {
                             Image(systemName: "play.fill")
                                 .font(.system(size: 18))
                             Text("LEFT")
                                 .font(.system(size: 10, weight: .bold))
                         }
                             .foregroundColor(.white)
                     )
             }

             Text("10h 50m ago ◦")
                 .foregroundColor(colorScheme == .light ? .eastBay : .white)
                 .font(.system(size: 12, weight: .light))
         }
     }

     private var nursingRightView: some View {
         VStack(alignment: .leading) {
             Text("HENRY")
                 .foregroundColor(colorScheme == .light ? .eastBay : .white)
                 .font(.system(size: 14, weight: .medium))

             Link(destination: URL(string: "URL")!) {
                 Circle()
                     .fill(Color.burntSienna)
                     .frame(width: 79, height: 79)
                     .overlay(
                         VStack(spacing: 5) {
                             Image(systemName: "play.fill")
                                 .font(.system(size: 18))
                             Text("RIGHT")
                                 .font(.system(size: 10, weight: .bold))
                         }
                             .foregroundColor(.white)
                     )
                     .overlay(
                         Circle()
                             .fill(Color.lynch)
                             .frame(width: 24, height: 24)
                             .overlay(
                                 Text("LS")
                                     .font(.system(size: 10, weight: .bold))
                                     .foregroundColor(.white)
                             ), alignment: .topTrailing)
             }

             HStack(spacing: 9) {
                 HStack(spacing: 4) {
                     Image(systemName: "l.circle.fill")
                         .foregroundColor(.burntSienna)
                     Text("45m")
                         .foregroundColor(colorScheme == .light ? .eastBay : .white)
                         .fontWeight(.light)
                 }
                 HStack(spacing: 4) {
                     Image(systemName: "r.circle.fill")
                         .foregroundColor(.burntSienna)
                     Text("60m")
                         .foregroundColor(colorScheme == .light ? .eastBay : .white)
                         .fontWeight(.light)
                 }
             }
             .font(.system(size: 12))
         }
     }
 }

 #if DEBUG
 struct WidgetMedium_Previews: PreviewProvider {
     static var previews: some View {
         WidgetMedium()
             .previewContext(WidgetPreviewContext(family: .systemMedium))
             .environment(\.colorScheme, .light)
         WidgetMedium()
             .previewContext(WidgetPreviewContext(family: .systemMedium))
             .environment(\.colorScheme, .dark)
     }
 }
 #endif
*/
