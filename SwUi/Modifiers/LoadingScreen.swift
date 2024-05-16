//
//  LoadingScreen.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 16.05.2024.
//

import SwiftUI

extension View {
    func showLoading(_ bool: Bool) -> some View {
        self.overlay {
            if bool {
                ZStack {
                    Color.clear
                        .background(.ultraThinMaterial)
                    
                    ProgressView()
                        .progressViewStyle(.circular)
                        .controlSize(.large)
                }
                .ignoresSafeArea()
            }
        }
    }
}

struct LoadingScreen: View {
    
    @State var isLoading: Bool = false
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.6)
            
            Image("123")
                .resizable()
            
            VStack {
                Spacer()
                
                Button("Start loading") {
                    isLoading = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        isLoading = false
                    }
                }
                .buttonStyle(.filled)
                .frame(height: 80)
                .padding()
            }
        }
        .ignoresSafeArea()
        .showLoading(isLoading)
    }
}

#Preview {
    LoadingScreen()
}
