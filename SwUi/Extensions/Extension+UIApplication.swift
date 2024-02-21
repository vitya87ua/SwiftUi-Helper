//
//  Extension+UIApplication.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 21.02.2024.
//

import UIKit

public extension UIApplication {
    func currentWindow() -> UIWindow? {
        let connectedScenes: [UIWindowScene] = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive}
            .compactMap { $0 as? UIWindowScene }
        
        let window: UIWindow? = connectedScenes.first?
            .windows
            .first(where: \.isKeyWindow)
        
        return window
    }
}
