//
//  PathTest.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 13.07.2022.
//

import SwiftUI

struct PathTest: View {
    var body: some View {
        PathTestShape()
            .equalFrame(30)
    }
}

#if DEBUG
struct PathTest_Previews: PreviewProvider {
    static var previews: some View {
        PathTest()
    }
}
#endif

struct PathTestShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addEllipse(in: rect)
        }
    }
}
