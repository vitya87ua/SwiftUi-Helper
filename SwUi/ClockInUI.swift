//
//  ClockInUI.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 01.10.2021.
//

import SwiftUI

struct ClockInUI: View {

    @State private var time: Date = Date()
    @State private var timeSt: String = ""

    private let timer = Timer.publish(every: 3, on: .current, in: .default)

    var body: some View {
        VStack(spacing: 15) {
            Text("Update:")

            VStack(spacing: 15) {
                VStack {
                    Text("time, style: .time")
                    Text(Date(), style: .time)
                }
                VStack {
                    Text("time, style: .timer")
                    Text(Date(), style: .timer)
                }
                VStack {
                    Text("time, style: .offset")
                    Text(Date(), style: .offset)
                }
                VStack {
                    Text("time, style: .relative")
                    Text(Date(), style: .relative)
                }
                VStack {
                    Text("time, style: .date")
                    Text(Date(), style: .date)
                }
            }
            .foregroundColor(.blue)
            Text(time.description)
            Text(timeSt)
            Text(time, style: .time)
                .onReceive(timer) { tim in
                    time = Date()
                    timeSt = tim.description
                }

            Text(Date().description)

            Button("Start") {
                timer.connect()
            }
        }
    }
}

#if DEBUG
struct ClockInUI_Previews: PreviewProvider {
    static var previews: some View {
        ClockInUI()
    }
}
#endif
