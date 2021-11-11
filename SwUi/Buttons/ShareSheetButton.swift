//
//  ShareSheetButton.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 11.11.2021.
//

import SwiftUI

struct ShareSheetButton: View {
    
    var body: some View {
        
        Button {
            actionSheet()
        } label: {
            Text("Share")
        }
        
    }
    
    func actionSheet() {
        guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

#if DEBUG
struct ShareSheetButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheetButton()
    }
}
#endif
