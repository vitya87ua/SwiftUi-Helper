//
//  WidgetSmall.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 13.10.2021.
//

import SwiftUI
import WidgetKit

struct WidgetSmall: View {
    
    var body: some View {
        ZStack {
            Color.scooter

            VStack(spacing: 0) {
                HStack {
                    Text("username")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.leading)
                        .padding(.vertical, 3)

                    Spacer()

                    Image("logo")
                        .padding(.trailing)
                        .padding(.vertical, 3)
                        .unredacted()
                }
//                .redacted(reason: model.userID == nil ? .placeholder : [])

                Button {

                } label: {
                    VStack(alignment: .center, spacing: 5) {
                        Text("activityTitle")
                            .font(.system(size: 13))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.red)
                        
                        Image(systemName: 1 == 1 ? "pause.fill" : "play.fill")
                            .foregroundColor(.scooter)

                        if 1 == 1 {
                            HStack(alignment: .center) {
                                Spacer()
                                Text(Date(timeIntervalSinceNow: -10), style: .timer)
                                    .font(.system(size: 18))
                                    .lineLimit(nil)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.green)
                                Spacer()
                            }
                        }
                    }
                    .frame(width: 100, height: 100)
                    .background(Color.white)
                    .clipShape(Circle())
                }
//                .padding(.bottom)
                
                Text("gshgs")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .padding(.top, 2)
            }
        }
//        .overlay(
//            Text("dur")
//                .foregroundColor(.white)
//                .font(.system(size: 14, weight: .bold))
//                .padding(.bottom, 3), alignment: .bottom)
    }
}

#if DEBUG
struct WidgetSmall_Previews: PreviewProvider {
    static var previews: some View {
        WidgetSmall()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
#endif
