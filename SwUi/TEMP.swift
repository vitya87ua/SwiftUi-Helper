//
//  TEMP.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 01.09.2021.
//

import SwiftUI

class Model: ObservableObject {
    @Published var textOb: String = "firstText"
    @Published var tim: Int = 0
    
    var timer: Timer = Timer()
    
    func startTim() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.tim += 1
            }
        }
    }
    
    func stopTim() {
        timer.invalidate()
    }
}

struct TEMP: View {

    @ObservedObject var viewModel: Model = Model()
    @State var opac = 1.0
    @State private var currentIndex: Int = 0
    
    @Environment(\.multiplayerKey) var mult
    @Environment(\.fetcherKey) var fetch

    var body: some View {
        ZStack {
            Color.pink.opacity(opac)
            VStack {
                Text("\(viewModel.tim)")
                
                HStack {
                    Button("START") {
                        viewModel.startTim()
                    }
                    
                    Button("PAUSE") {
                        viewModel.stopTim()
                    }
                }
                
                Button("COLOR") {
                    opac = CGFloat.random(in: 0.0...1.0)
                }
            }
        }
    }
}

#if DEBUG
struct TEMP_Previews: PreviewProvider {
    static var previews: some View {
        TEMP()
    }
}
#endif
