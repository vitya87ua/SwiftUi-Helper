//
//  CustomTabViewWithIndex.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 09.11.2021.
//

import SwiftUI

struct StringData {
    let title: String
    let subTitle: String
}

struct CustomTabViewWithIndex: View {
    
    let pages: [StringData]
    
    @State private var currentIndex: Int = 0
    
    private let rectangleHeight: CGFloat = 77
    private let indexSpacing: CGFloat = 12
    
    var body: some View {
        VStack(spacing: 21) {
            TabView(selection: $currentIndex) {
                ForEach(pages.indices, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.red)
                        .frame(width: .infinity, height: rectangleHeight)
                        .overlay(
                            VStack {
                                Text(pages[index].title)
                                Text(pages[index].subTitle)
                            })
                        .padding(.horizontal, 30)
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack(spacing: indexSpacing) {
                ForEach(pages.indices) { num in
                    Circle()
                        .frame(width: 7, height: 7, alignment: .center)
                        .foregroundColor(.black)
                        .opacity(num == currentIndex ? 1 : 0.2)
                }
            }
        }
        .frame(height: totalHeight())
    }
    
    private func totalHeight() -> CGFloat {
        let viewHeight = rectangleHeight + indexSpacing
        return CGFloat(viewHeight + ((viewHeight) / 100) * 20)
    }
}

#if DEBUG
struct CustomTabViewWithIndex_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabViewWithIndex(pages: [
            StringData(title: "One Screen", subTitle: "423542354"),
            StringData(title: "Two Screen", subTitle: "t5y44y4y4"),
            StringData(title: "Three Screen", subTitle: "fy44547sg")
        ])
    }
}
#endif
