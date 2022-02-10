//
//  TimerWithDelegate.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 30.01.2022.
//

import SwiftUI

enum TimerName { // For identify timer
    case loadingTimer
    case playTimer
}

protocol TimerProtocol: AnyObject {
    func timerAction(timer: TimerModel)
}

final class TimerModel {
    let name: TimerName
    private let timeInterval: Double
    private let repeats: Bool

    weak var delegate: TimerProtocol?

    private var timer: Timer = Timer()

    private(set) var counter: Int = 0

    init(name: TimerName, seconds: Double, repeats: Bool = false) {
        self.name = name
        self.timeInterval = seconds
        self.repeats = repeats
    }

    func run() {
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: repeats) { [weak self] _ in
            self?.delegate?.timerAction(timer: self!)
            self?.counter += 1
        }
    }

    func stop() {
        if timer.isValid {
            timer.invalidate()
        }
    }

    func restart() {
        reset()
        run()
    }

    func reset() {
        counter = 0
    }
}

final class TimerViewModel: ObservableObject, TimerProtocol {

    @Published var tim1Cou: Int = 0

    func timerAction(timer: TimerModel) {
        print(#fileID, #function, #line, "timerAction", timer.name)

        if timer.name == .playTimer {
            tim1Cou = timer.counter
        }
    }


    var timerClass = TimerModel(name: .loadingTimer, seconds: 2)
    var timerClass2 = TimerModel(name: .playTimer, seconds: 1, repeats: true)

    init() {
        timerClass.delegate = self
        timerClass2.delegate = self
    }
}

struct TimerWithDelegate: View {

    @ObservedObject var viewModel = TimerViewModel()

    var body: some View {
        VStack {
            Text("Hello, World!")

            HStack {
                Text("Tim 1 \(viewModel.timerClass.counter)")
                Text("Tim 2 \(viewModel.timerClass2.counter)")
            }

            Button("RUN") {
                viewModel.timerClass.run()
                viewModel.timerClass2.run()
            }

            Button("STOP") {
                viewModel.timerClass.stop()
                viewModel.timerClass2.stop()
            }

            Button("RESET") {
                viewModel.timerClass.reset()
                viewModel.timerClass2.reset()
            }

            Button("PRINT") {
                print(#fileID, #function, #line, "PRINT")
            }

            HStack(spacing: 30) {
                ProgressCircleView(progressValue: Double(viewModel.tim1Cou))
                    .frame(width: 150, height: 150)

                ProgressCircleView(progressValue: Double(100 - viewModel.tim1Cou))
                    .frame(width: 150, height: 150)
            }
            .padding()
        }
    }
}

#if DEBUG
struct TimerWithDelegate_Previews: PreviewProvider {
    static var previews: some View {
        TimerWithDelegate()
    }
}
#endif
