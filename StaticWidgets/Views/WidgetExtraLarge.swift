//
//  WidgetExtraLarge.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 13.10.2021.
//

import SwiftUI
import WidgetKit

struct WidgetExtraLarge: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#if DEBUG
struct WidgetExtraLarge_Previews: PreviewProvider {
    static var previews: some View {
        WidgetExtraLarge()
            .previewContext(WidgetPreviewContext(family: .systemExtraLarge))

    }
}
#endif
