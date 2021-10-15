//
//  WidgetSmall.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 13.10.2021.
//

import SwiftUI
import WidgetKit

struct WidgetSmall: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#if DEBUG
struct WidgetSmall_Previews: PreviewProvider {
    static var previews: some View {
        WidgetSmall()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
#endif
