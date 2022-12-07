//
//  NetworkLayer.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.12.2022.
//

import Foundation

protocol NetworkLayer {
    var authentication: AuthenticationNetwork { get }
    var media: MediaNetwork { get }
}

final class NetworkManager: NetworkLayer {
    lazy var authentication: AuthenticationNetwork = AuthenticationNetworkManager()
    lazy var media: MediaNetwork = MediaManager()
}

