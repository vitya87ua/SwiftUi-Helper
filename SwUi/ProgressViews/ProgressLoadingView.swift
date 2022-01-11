//
//  ProgressLoadingView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 15.12.2021.
//

import SwiftUI

struct ProgressLoadingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, World!")
            
            ProgressView()
                .progressViewStyle(.circular)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.red))
            
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(2)
            
            ProgressView(value: 23, total: 100, label: {
                Text("Load...")
            })
                .progressViewStyle(.linear)
                .padding()
        }
    }
}

#if DEBUG
struct ProgressLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressLoadingView()
    }
}
#endif
