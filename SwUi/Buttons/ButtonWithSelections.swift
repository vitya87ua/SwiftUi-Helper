//
//  ButtonWithSelections.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 09.11.2021.
//

import SwiftUI

struct ButtonWithSelections: View {
    
    @State var activeButton: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    HStack(spacing: 18) {
                        Text("main").font(.system(size: 18)).bold()
                        Image("group").font(.system(size: 26))
                    }
                }
                .buttonStyle(SelectionButton(isActive: activeButton))
                
                Button {
                    
                } label: {
                    HStack(spacing: 18) {
                        Text("journal").font(.system(size: 18)).bold()
                        Image("writing").font(.system(size: 26))
                    }
                }
                .buttonStyle(SelectionButton(isActive: !activeButton))
            }
            
            Button("Update State") {
                activeButton = !activeButton
            }
        }
    }
}

struct SelectionButton: ButtonStyle {
    
    let  isActive: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.black.opacity(configuration.isPressed ? 0.5 : 1))
            .frame(width: 151, height: 62)
            .background(Color.lightGray)
            .cornerRadius(18)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(isActive ? Color.red : Color.clear, lineWidth: 3)
            )
    }
}

#if DEBUG
struct ButtonWithSelections_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWithSelections()
    }
}
#endif
