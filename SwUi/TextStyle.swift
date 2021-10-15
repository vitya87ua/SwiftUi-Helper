//
//  TextStyle.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 27.07.2021.
//

import SwiftUI

struct TextStyle: View {
    var body: some View {
        VStack {
            VStack {
                Text("Hello, World! largeTitle")
                    .font(.largeTitle)
                Text("Hello, World! title")
                    .font(.title)
                Text("Hello, World! title2")
                    .font(.title2)
                Text("Hello, World! title3")
                    .font(.title3)
                Text("Hello, World! headline")
                    .font(.headline)
                Text("Hello, World! callout")
                    .font(.callout)
                Text("Hello, World! subheadline")
                    .font(.subheadline)
                Text("Hello, World! footnote")
                    .font(.footnote)
                Text("Hello, World! caption")
                    .font(.caption)
                Text("Hello, World! caption2")
                    .font(.caption2)
            }
            .padding()

            VStack {
                Text("Hello, World! black")
                    .fontWeight(.black)
                Text("Hello, World! heavy")
                    .fontWeight(.heavy)
                Text("Hello, World! bold")
                    .fontWeight(.bold)
                Text("Hello, World! semibold")
                    .fontWeight(.semibold)
                Text("Hello, World! medium")
                    .fontWeight(.medium)
                Text("Hello, World! regular")
                    .fontWeight(.regular)
                Text("Hello, World! light")
                    .fontWeight(.light)
                Text("Hello, World! thin")
                    .fontWeight(.thin)
                Text("Hello, World! ultraLight")
                    .fontWeight(.ultraLight)
            }
            .font(.system(size: 25))
        }
    }
}

struct TextStyle_Previews: PreviewProvider {
    static var previews: some View {
        TextStyle()
    }
}
