//
//  InstagramSharingFeedAndStories.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 14.12.2021.
//

import Foundation
import UIKit

// MARK: - Attention
// If you want to share image(ScreenShot) to Instagram stories you must add the LSApplicationQueriesSchemes key with propetry "instagram://" to your Info.plist

final class InstagramSharingFeedAndStories: NSObject, UIDocumentInteractionControllerDelegate {
    
    static let shared = InstagramSharingFeedAndStories()
    
    private override init() {}
    
    func shareToFeed(image: UIImage) {
        
        let saveImagePath = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image.ig")
        
        let imageData = image.pngData()
        
        do {
            try imageData?.write(to: saveImagePath)
        } catch {
            print("Instagram sharing error \(error). LocalizedDescription \(error.localizedDescription)")
        }
        
        let vc = InstagramSharingFeedAndStories.getRootViewController()!
        
        let picker = UIDocumentInteractionController(url: saveImagePath)
        picker.uti = "com.instagram.exclusivegram"
        picker.annotation = ["InstagramCaption" : "Testing"]
        picker.delegate = self
        picker.presentOpenInMenu(from: vc.view.frame, in: vc.view, animated: false)
        picker.presentPreview(animated: false)
    }
    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        InstagramSharingFeedAndStories.getRootViewController()!
    }
    
    static func getRootViewController() -> UIViewController? {
        UIApplication.shared.windows.first?.rootViewController
    }
}
