//
//  SwUiApp.swift
//  SwUi
//
//  Created by Віктор Бережницький on 18.06.2021.
//

import SwiftUI

class Lock: ObservableObject {
    @Published var count: Int
    
    @Published var isOn: Bool {
        didSet {
            print(#function, "Fire", oldValue)
        }
    }
    
    init() {
        self.count = 0
        self.isOn = false
    }
    
    func increase(num: Int = 1) {
        self.count += num
    }
    
    func decrease(num: Int = 1) {
        self.count -= num
    }
}

@main
struct SwUiApp: App {
    
    @StateObject var state = Lock()
//    @EnvironmentObject var state: Lock
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environmentObject(state)
//            TEMP()
            TimerWithDelegate()
//            CalPixelsAndPointsView()
        }
    }
}
