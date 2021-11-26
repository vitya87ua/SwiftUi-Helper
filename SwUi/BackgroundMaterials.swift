//
//  BackgroundMaterials.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 26.11.2021.
//

import SwiftUI

struct BackgroundMaterials: View {
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack {
                ZStack {
                    VStack(spacing: 0) {
                        Color.red
                        Color.blue
                    }
                    
                    Text("thinMaterial")
                        .padding(40)
                        .background(.thinMaterial)
                    
                }
                .frame(width: .infinity, height: 150)
                
                ZStack {
                    VStack(spacing: 0) {
                        Color.red
                        Color.blue
                    }
                    
                    Text("ultraThinMaterial")
                        .padding(40)
                        .background(.ultraThinMaterial)
                    
                }
                .frame(width: .infinity, height: 150)
                
                ZStack {
                    VStack(spacing: 0) {
                        Color.red
                        Color.blue
                    }
                    
                    Text("thickMaterial")
                        .padding(40)
                        .background(.thickMaterial)
                    
                }
                .frame(width: .infinity, height: 150)
                
                ZStack {
                    VStack(spacing: 0) {
                        Color.red
                        Color.blue
                    }
                    
                    Text("ultraThickMaterial")
                        .padding(40)
                        .background(.ultraThickMaterial)
                    
                }
                .frame(width: .infinity, height: 150)
            }
        }
    }
}

#if DEBUG
struct BackgroundMaterials_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMaterials()
    }
}
#endif
