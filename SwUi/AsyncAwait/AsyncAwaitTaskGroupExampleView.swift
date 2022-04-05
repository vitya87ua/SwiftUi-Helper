//
//  AsyncAwaitTaskGroupExampleView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 04.04.2022.
//

import SwiftUI

final class AsyncAwaitTaskGroupExampleViewModel: ObservableObject {
    
    @Published var textArray: [String] = ["Hello"]
    
    func changeArrayText()  {
        Task {
            textArray =  await runTasks()
        }
    }
    
    private func runTasks() async -> [String] {
        let result: [String] = await withTaskGroup(of: String.self) { taskGroup in
            
            for i in 0..<10 {
                taskGroup.addTask {
                    return await self.newText("Task \(i)")
                }                
            }
            
            var childTaskResults: [String] = []
            
            for await childTask in taskGroup {
                childTaskResults.append(childTask)
            }
            
            return childTaskResults
        }
        
        return result
    }
    
    
    private func newText(_ text: String) async -> String {
        try? await Task.sleep(nanoseconds: 1 * 500_000_000)
        return text + " " + String(Int.random(in: 0...100))
    }
}

struct AsyncAwaitTaskGroupExampleView: View {
    
    @StateObject var viewModel: AsyncAwaitTaskGroupExampleViewModel = AsyncAwaitTaskGroupExampleViewModel()
    
    var body: some View {
        VStack {
            Text("TaskGroup")
                .font(.system(size: 20, weight: .bold))
            
            Spacer()
            
            VStack {
                ForEach(viewModel.textArray, id: \.self) { text in
                    Text(text)
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
struct AsyncAwaitTaskGroupExampleView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncAwaitTaskGroupExampleView()
    }
}
#endif
