//
//  AutoScrollingStringView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 27.07.2021.
//
// https://github.com/joekndy/MarqueeText/blob/master/Sources/MarqueeText/MarqueeText.swift

import SwiftUI

struct AutoScrollingStringView: View {

    var text: String = ""
    let font: UIFont = .systemFont(ofSize: 12, weight: .bold)

    @State private var isScrolling: Bool = false

    var body: some View {

        let stringWidth = text.widthOfString(usingFont: font)
        let stringHeight = text.heightOfString(usingFont: font)

        ZStack {
            GeometryReader { geometry in
                Group {
                    Text(self.text)
                        .lineLimit(1)
                        .font(.init(font))
                        .offset(x: self.isScrolling ? -stringWidth - stringHeight * 2 : 0)
                        .animation(Animation
                                    .linear(duration: Double(stringWidth) / 30)
                                    .repeatForever(autoreverses: false), value: self.isScrolling
                        )
                        .onAppear {
                            if geometry.size.width < stringWidth {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    self.isScrolling = true
                                }
                            }
                        }
                        .fixedSize(horizontal: true, vertical: false)

                    Text(self.text)
                        .lineLimit(1)
                        .font(.init(font))
                        .offset(x: self.isScrolling ? 0 : stringWidth + stringHeight * 8)
                        .animation(Animation
                                    .linear(duration: Double(stringWidth) / 30)
                                    .repeatForever(autoreverses: false), value: self.isScrolling
                        )
                        .fixedSize(horizontal: true, vertical: true)
                }
                .position(y: geometry.size.height / 2)
            }
        }
        .frame(height: 26)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(color: .gray, radius: 2)
        .overlay(
            Text(" 27/07/2021 PM ")
                .font(.system(size: 12, weight: .light))
                .background(Color.white), alignment: .trailing
        )
    }
}

extension String {

    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }

    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
}

#if DEBUG
struct AutoScrollingStringView_Previews: PreviewProvider {
    static var previews: some View {
        AutoScrollingStringView(text: "13A: Must not drive beyond 13 hours without taking 8 consequtive hours off-duty")
    }
}
#endif
