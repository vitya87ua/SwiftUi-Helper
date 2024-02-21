//
//  UIActivityHelper.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 21.02.2024.
//

import UIKit
import LinkPresentation

class ItemDetailSource: NSObject {
    let title: String
    let uiImage: UIImage
    
    init(title: String, uiImage: UIImage) {
        self.title = title
        self.uiImage = uiImage
    }
}

extension ItemDetailSource: UIActivityItemSource {
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        uiImage
    }
    
    func activityViewController(
        _ activityViewController: UIActivityViewController,
        itemForActivityType activityType: UIActivity.ActivityType?
    ) -> Any? {
        uiImage
    }
    
    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        let metaData: LPLinkMetadata = LPLinkMetadata()
        metaData.title = title
        metaData.imageProvider = NSItemProvider(object: uiImage)
        return metaData
    }
}

// MARK: - Usage
/*
 var activityItems: [ItemDetailSource] = [ItemDetailSource(title: "Title", uiImage: UIImage(named: "123"))]
 
 let activityVC: UIActivityViewController = UIActivityViewController(
     activityItems: activityItems,
     applicationActivities: nil
 )
 
 let rootVC = UIApplication.shared.currentWindow()?.rootViewController
 rootVC.present(activityVC, animated: true, completion: nil)
 */
