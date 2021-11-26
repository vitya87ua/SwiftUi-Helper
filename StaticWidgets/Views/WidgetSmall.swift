//
//  WidgetSmall.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 13.10.2021.
//

import SwiftUI
import WidgetKit

struct WidgetSmall: View {
    
    var todayIsWake: Bool = true
    
    var body: some View {
        ZStack {
            Color.lightSand

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
            .clipShape(Circle())
            .padding(8)
        }

    }
}

#if DEBUG
struct WidgetSmall_Previews: PreviewProvider {
    static var previews: some View {
        WidgetSmall(todayIsWake: true)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
        WidgetSmall(todayIsWake: false)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
#endif
