//
//  ButtonStylies.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 26.11.2021.
//

import SwiftUI

struct ButtonStylies: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Hello-plain") { }
            .buttonStyle(.plain)
            
            Button("Hello-automatic") { }
            .buttonStyle(.automatic)
            
            if #available(iOS 15.0, *) {
                Button("Hello-bordered") { }
                .buttonStyle(.bordered)
                
                Button("Hello-bordered-des", role: .destructive) { }
                .buttonStyle(.bordered)
                
                Button("Hello-borderedProminent") { }
                .buttonStyle(.borderedProminent)
                
                Button("Hello-borderedProminent-tint") { }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
                
                Button("Hello-bordered-des", role: .destructive) { }
                .buttonStyle(.borderedProminent)

                Button("Hello-borderless") { }
                .buttonStyle(.borderless)
                
                Button { } label: {
                    Label("Favourite", systemImage: "star")
                }
                .buttonStyle(.borderedProminent)
            }
            
            
            Button { } label: {
                Label("Favourite", systemImage: "star")
            }
            
            ZStack {
                Color.yellow
                if #available(iOS 15.0, *) {
                    Text("Hello")
                        .padding(30)
                        .background(.ultraThickMaterial)
                } else {
                    // Fallback on earlier versions
                }
            }
            .frame(width: 200, height: 200)

        }
    }
}

#if DEBUG
struct ButtonStylies_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStylies()
    }
}
#endif
