//
//  WidgetMedium.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 13.10.2021.
//

import SwiftUI
import WidgetKit

struct WidgetMedium: View {
    
    var todayIsWake: Bool = false
    
    var body: some View {
        ZStack {
            Color.lightSand
            
            HStack(alignment: .center, spacing: 1) {
                ZStack {
                    Color.neroBlack
                    
                    if todayIsWake {
                        VStack(spacing: -3) {
                            Text("Today")
                                .font(.neueMontrealBold(size: 25))
                            
                            Text("05:34")
                                .font(.neueMontrealBold(size: 40))
                            
                            Text("AM")
                                .font(.neueMontrealBold(size: 25))
                        }
                        .foregroundColor(.lightSand)
                    } else {
                        Text("woke up".uppercased())
                            .font(.neueMontrealBold(size: 25))
                            .foregroundColor(.lightSand)
                            .fixedSize()
                    }
                }
//                .frame(width: 140, height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(10)
                
                Spacer(minLength: 5)
                
                VStack(alignment: .leading, spacing: 10) {
                    // ForEach(0..<4) { item in
                    VStack(alignment: .leading, spacing: 2) {
                        Text("10/14/21")
                        Text("My life changeda lot..")
                            .lineLimit(0)
                    }
                    .background(Color.timberWolf)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("11/14/21")
                        Text("I feel better.Today was...")
                            .lineLimit(0)
                    }
                    .background(Color.timberWolf)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("8/14/21")
                        Text("Today was goodday and I’m....")
                            .lineLimit(0)
                    }
                    .background(Color.timberWolf)
                    //                    }
                }
                .frame(width: 170)
                .font(.neueMontrealRegular(size: 15))
                .foregroundColor(.neroBlack)
                
                Spacer()
            }
//            .padding(.horizontal)
        }

    }
}

#if DEBUG
struct WidgetMedium_Previews: PreviewProvider {
    static var previews: some View {
        WidgetMedium(todayIsWake: true)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            .environment(\.colorScheme, .light)
        WidgetMedium(todayIsWake: false)
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
