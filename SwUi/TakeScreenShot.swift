//
//  TakeScreenShot.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 11.11.2021.
//

// Important: In order to call UIImageWriteToSavedPhotosAlbum() you must add the NSPhotoLibraryAddUsageDescription key to your Info.plist and explain to the user why you want to write images. If you fail to do this your app will crash when you attempt to write out the image.

import SwiftUI

struct TakeScreenShot: View {
    
    var textView: some View {
        Text("Hello, SwiftUI 23")
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
    
    var toScreeen: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Text("Hello, SwiftUI \(Date())")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
    }
    
    var body: some View {
        ZStack {
            Color.windRush
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                textView
                
                RoundedButton(title: "Save to PhotoLibrary") {
                    toScreeen.saveAsImage { image in
                         UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    }
                }
                
                RoundedButton(title: "Share via ActionSheet") {
                    toScreeen.saveAsImage { image in
                        actionSheet(image: image)
                    }
                }
                
                RoundedButton(title: "SHARE TO IG") {
                    toScreeen.saveAsImage { image in
                        InstagramSharingUtils.shareToInstagramStories(image: image)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    func actionSheet(image: UIImage) {
        let activityVC = UIActivityViewController(activityItems: [image, "SHARE IMAGE"], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

extension View {
    
    // Full screan
    func saveAsImage(completion: @escaping (UIImage) -> Void) {
        let screen = UIScreen.main.bounds
        
        let controller = UIHostingController(rootView: self.frame(width: screen.width, height: screen.height))
        controller.view.bounds = CGRect(origin: .zero, size: screen.size)
        
        let renderer = UIGraphicsImageRenderer(size: controller.view.bounds.size)
        let image = renderer.image { _ in
            controller.view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
        completion(image)
    }
    
    // Only View (Works with bugs)
    func saveAsImage1(completion: @escaping (UIImage) -> Void) {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        let image = renderer.image { _ in
            controller.view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
        completion(image)
    }
}

#if DEBUG
struct TakeScreenShot_Previews: PreviewProvider {
    static var previews: some View {
        TakeScreenShot()
    }
}
#endif
