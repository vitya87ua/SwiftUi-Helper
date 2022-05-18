//
//  TEMP.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 01.09.2021.
//

import SwiftUI

final class ViewModel: ObservableObject {
    @Published var confIsPres: Bool = false
}

struct TEMP: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    @State var sel: String = "Hello"
    @State var num: Int = 0
    @State var isPresented: Bool = false
    
    @GestureState var gestState: CGSize = .zero
    
    var body: some View {
        ZStack {
            Color.scooter
            
            VStack {
                Button("Conf") {
                    viewModel.confIsPres.toggle()
                }
                
                Label("Remove old files", systemImage: "trash")
                    .foregroundColor(.red)
                
                Menu {
                    Button(role: .destructive) {
                        
                    } label: {
                        Label("del4", systemImage: "trash")
                    }
                    
                    Button {
                        
                    } label: {
                        Label("del1", systemImage: "trash")
                    }
                    
                    Button {
                        
                    } label: {
                        Label("del2", systemImage: "trash")
                        
                    }.foregroundColor(.red)
                    
                    Button(role: .destructive) {
                        
                    } label: {
                        Label("del2", systemImage: "trash")
                    }
                    
                    
                } label: {
                    Image(systemName: "star")
                }
            }
        }
        .onSwipe { direct in
            print(#fileID, #line, "direct", direct)
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
