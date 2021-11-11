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

class InstagramSharingUtils {
    
    // Returns a URL if Instagram Stories can be opened, otherwise returns nil.
    private static var instagramStoriesUrl: URL? {
        if let url = URL(string: "instagram-stories://share?source_application=your-app-bundle-identifier") {
            if UIApplication.shared.canOpenURL(url) {
                return url
            }
        }
        return nil
    }
    
    // If Instagram Stories is available, writes the image to the pasteboard and
    // then opens Instagram.
    static func shareToInstagramStories(image: UIImage) {
        
        // Check that Instagram Stories is available.
        guard let instagramStoriesUrl = instagramStoriesUrl else {
            print(#fileID, #line, "Cant Open Instagram Stories")
            return
        }
        
        // Convert the image to data that can be written to the pasteboard.
        let imageDataOrNil = UIImage.pngData(image)
        guard let imageData = imageDataOrNil() else {
            print("🙈 Image data not available.")
            return
        }
        let pasteboardItem = ["com.instagram.sharedSticker.backgroundImage": imageData]
        let pasteboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(60 * 5)]
        
        // Add the image to the pasteboard. Instagram will read the image from the pasteboard when it's opened.
        UIPasteboard.general.setItems([pasteboardItem], options: pasteboardOptions)
        
        // Open Instagram.
        UIApplication.shared.open(instagramStoriesUrl, options: [:], completionHandler: nil)
    }
}
