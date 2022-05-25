//
//  StopWatchView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 24.05.2022.
//

import SwiftUI

struct StopWatchView: View {
    var body: some View {
        VStack {
            TimelineView(.periodic(from: .now, by: 1)) { context in
                let seconds = context.date.formatted(.dateTime.second(.defaultDigits))
                
                myTick(seconds: seconds)
                    .padding()
            }
        }
    }
    
    func myTick(seconds: String) -> some View {
        ZStack {
            ForEach(0..<180) { tick in
                straw(width: tickNumber(tick))
                    .opacity(tick % 6 == 0 ? 1 : 0.4)
                    .rotationEffect(.degrees(Double(tick)))
            }
            
            HStack {
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 220, height: 1.5, alignment: .center)
                Spacer()
            }
            .rotationEffect(.degrees((Double(seconds) ?? 0)/(60) * 360))
            .overlay {
                ZStack {
                    Circle()
                        .fill(Color.orange)
                    .equalFrame(7)
                    
                    Circle()
                        .fill(Color.white)
                    .equalFrame(3)
                }
            }
        }
    }
    
    func straw(width: CGFloat) -> some View {
        HStack {
            Rectangle()
                .frame(width: width, height: 1, alignment: .center)
            
            Spacer()
            
            Rectangle()
                .frame(width: width, height: 1, alignment: .center)
        }
        .foregroundColor(.primary)
    }
    
    func tickNumber(_ number: Int) -> CGFloat {
        var result: CGFloat = 0
        
        if number % 30 == 0 {
            result = 25
        } else if number % 6 == 0 {
            result = 11
        } else {
            result = 7
        }
        
        return result
    }
}

#if DEBUG
struct StopWatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchView()
    }
}
#endif
