//
//  CombineTestView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 15.02.2023.
//

import SwiftUI

struct CombineTestView: View {
    
    @StateObject var viewModel: CombineTestViewModel = CombineTestViewModel()
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            
            TextField("text", text: $viewModel.fieldText)
            
            Text(viewModel.dateText1)
            Text(viewModel.dateText)
            
            Button("Print", action: viewModel.printDate)
            
            Button("STOP", action: viewModel.stop)
        }
    }
}

#if DEBUG
struct CombineTestView_Previews: PreviewProvider {
    static var previews: some View {
        CombineTestView()
    }
}
#endif
