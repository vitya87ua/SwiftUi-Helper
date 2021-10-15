//
//  DeepLinkBuilder.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 15.10.2021.
//

import Foundation

final class DeepLinkBuilder {

    enum Side: String {
        case left = "left"
        case right = "right"
    }

    private let scheme: String = "widgets"
    private let host: String = "widget_activity"

    private let cidUrl: String = "cid"
    private let activityUrl: String = "activity"
    private let triggerTimerUrl: String = "trigger_timer"
    private let breastUrl: String = "breast"

    private var queryItems: [URLQueryItem] = []

    func cid(_ cid: String) -> DeepLinkBuilder {
        queryItems.append(URLQueryItem(name: cidUrl, value: cid))
        return self
    }

    func activity(_ activity: String) -> DeepLinkBuilder {
        queryItems.append(URLQueryItem(name: activityUrl, value: activity))
        return self
    }

    func triggerTimer(_ triggerTimer: String) -> DeepLinkBuilder {
        queryItems.append(URLQueryItem(name: triggerTimerUrl, value: triggerTimer))
        return self
    }

    func breast(_ breast: Side) -> DeepLinkBuilder {
        queryItems.append(URLQueryItem(name: breastUrl, value: breast.rawValue))
        return self
    }

    func customQueryItem(_ item: URLQueryItem) -> DeepLinkBuilder {
        queryItems.append(item)
        return self
    }

    func build() -> URL {
        var urlComp = URLComponents()
        urlComp.scheme = scheme
        urlComp.host = host
        urlComp.queryItems = queryItems
        return urlComp.url!
    }
}

/*
print(DeepLinkBuilder() // widgets://widget_activity?activity=one&custom&breast=right&trigger_timer=543&cid=viktor
        .activity("one")
        .customQueryItem(URLQueryItem(name: "custom", value: nil))
        .breast(.right)
        .triggerTimer("543")
        .cid("viktor")
        .build()
)
*/
