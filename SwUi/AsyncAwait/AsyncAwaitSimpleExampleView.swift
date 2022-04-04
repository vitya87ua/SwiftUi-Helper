//
//  AsyncAwaitSimpleExampleView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 04.04.2022.
//

import SwiftUI

final class AsyncAwaitSimpleExampleViewModel: ObservableObject {
    
    // MARK: - Single task
    @Published var text: String = "Hello"
    
    func changeText()  {
        Task {
            text =  await loadingNewText()
        }
    }
    
    private func loadingNewText() async -> String {
        try? await Task.sleep(nanoseconds: 3 * 1_000_000_000) // 3sec
        return "Bye"
    }
    
    
    // MARK: - Group of async tasks
    @Published var textArray: [String] = ["Hello"]
    
    func changeArrayText()  {
        Task {
            textArray =  await runTask()
        }
    }
    
    private func runTask() async -> [String] {
        var array: [String] = []
        
        for i in 0..<10 {
            let first = await newText("Task \(i)")
            array.append(first)
        }
        
        return array
    }
    
    
    private func newText(_ text: String) async -> String {
        try? await Task.sleep(nanoseconds: 1 * 500_000_000)
        return text + " " + String(Int.random(in: 0...100))
    }
}

struct AsyncAwaitSimpleExampleView: View {
    
    @StateObject var viewModel: AsyncAwaitSimpleExampleViewModel = AsyncAwaitSimpleExampleViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.text)
            
            Button("Change Text") {
                viewModel.changeText()
            }
            
            VStack {
                ForEach(viewModel.textArray, id: \.self) { text in
                    Text(text)
                        .font(.system(size: 8))
                }
            }
            .padding(.top, 40)
            
            Button("Group of Task 5sec") {
                viewModel.changeArrayText()
            }
        }
    }
}

#if DEBUG
struct AsyncAwaitSimpleExampleView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncAwaitSimpleExampleView()
    }
}
#endif
