//
//  StaticWidgets.swift
//  StaticWidgets
//
//  Created by Viktor Berezhnytskyi on 13.10.2021.
//

import WidgetKit
import SwiftUI

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct StaticWidgetsEntryView : View {

    var entry: Provider.Entry

    @Environment(\.widgetFamily) var family

    var body: some View {
        switch family {
        case .systemSmall: WidgetSmall()
        case .systemMedium: WidgetMedium()
        case .systemLarge: WidgetLarge()
        case .systemExtraLarge: WidgetExtraLarge()
        @unknown default: fatalError()
        }
    }
}

@main
struct StaticWidgets: Widget {
    let kind: String = "StaticWidgets"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            StaticWidgetsEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
//        .supportedFamilies([.systemMedium])
    }
}

#if DEBUG
struct StaticWidgets_Previews: PreviewProvider {
    static var previews: some View {
        StaticWidgetsEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
#endif
