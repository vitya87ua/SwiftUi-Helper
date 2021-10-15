//
//  WidgetLarge.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 13.10.2021.
//

import SwiftUI
import WidgetKit

struct WidgetLarge: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#if DEBUG
struct WidgetLarge_Previews: PreviewProvider {
    static var previews: some View {
        WidgetLarge()
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
#endif
