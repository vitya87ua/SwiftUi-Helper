//
//  StateObservedObjectExample.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 15.04.2022.
//

// Кожного разу коли оновоюється randomNumber перемальовується вʼю StateObservedObjectExample
// Саб Вʼю яка з ObservedObject обнуляється(переІнічується), Вʼю яка з StateObject залишається
// в памʼяті.

import SwiftUI

struct StateObservedObjectExample: View {
    @State var randomNumber = 0

    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            Text("Random number is: \(randomNumber)")
            
            Button("Randomize number") {
                randomNumber = (0..<1000).randomElement()!
            }
            
            CounterViewObservedObject()
            CounterViewStateObject()
        }
        .padding(.bottom)
    }
}


final class CounterViewModelObservedObject: ObservableObject {
    @Published var count = 0

    func incrementCounter() {
        count += 1
    }
    
    init() {
        print(#fileID, #line, "ObservedObject-INIT", Date())
    }
    
    deinit {
        print(#fileID, #line, "ObservedObject-DE-INIT", Date())
    }
}

struct CounterViewObservedObject: View {
    @ObservedObject var viewModel = CounterViewModelObservedObject()

    var body: some View {
        VStack {
            Text("ObservedObject Count is: \(viewModel.count)")
            Button("Increment Counter ObservedObject") {
                viewModel.incrementCounter()
            }
        }
    }
}

final class CounterViewModelStateObject: ObservableObject {
    @Published var count = 0

    func incrementCounter() {
        count += 1
    }
    
    init() {
        print(#fileID, #line, "StateObject-INIT", Date())
    }
    
    deinit {
        print(#fileID, #line, "StateObject-DE-INIT", Date())
    }
}

struct CounterViewStateObject: View {
    @StateObject var viewModel = CounterViewModelStateObject()

    var body: some View {
        VStack {
            Text("StateObject Count is: \(viewModel.count)")
            Button("Increment CounterStateObject ") {
                viewModel.incrementCounter()
            }
        }
    }
}


#if DEBUG
struct StateObservedObjectExample_Previews: PreviewProvider {
    static var previews: some View {
        StateObservedObjectExample()
    }
}
#endif
