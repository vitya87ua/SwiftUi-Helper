//
//  InstagramSharingUtils.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 11.11.2021.
//

// MARK: - Attention
// If you want to share image(ScreenShot) to Instagram stories you must add the LSApplicationQueriesSchemes key with propetry "instagram-stories" to your Info.plist
// https://codakuma.com/instagram-stories-sharing-swiftui/

import Foundation
import UIKit

class InstagramUtils {
    
    private static let storiesUrl: URL? = URL(string: "instagram-stories://share?source_application=your-app-bundle-identifier")
    
    static func shareToStories(image: UIImage) {
        
        // If Instagram Stories, URL & canOpenURL is available, writes the image to the pasteboard and then opens Instagram.
        // Convert the image to data(imageData) that can be written to the pasteboard.
        
        if let url = storiesUrl, UIApplication.shared.canOpenURL(url), let imageData = image.pngData() {
            
            let pasteboardItem = ["com.instagram.sharedSticker.backgroundImage": imageData]
            let pasteboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(60 * 5)]
            
            // Add the image to the pasteboard. Instagram will read the image from the pasteboard when it's opened.
            UIPasteboard.general.setItems([pasteboardItem], options: pasteboardOptions)
            
            // Open Instagram.
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            
        } else {
            
            // If Instagram Stories, URL & canOpenURL is unavailable, open Instagram in AppStore.
            let urlAppStore: URL? = URL(string: "itms-apps://apps.apple.com/app/id389801252")
            if let url = urlAppStore, UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}
