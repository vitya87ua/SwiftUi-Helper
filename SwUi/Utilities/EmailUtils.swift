//
//  EmailUtils.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 08.12.2021.
//

import Foundation
import MessageUI

class EmailUtils: NSObject, MFMailComposeViewControllerDelegate {
    
    static let shared = EmailUtils()
    
    private override init() {}
    
    func sendEmail(subject: String, body: String, to: String) {
        if !MFMailComposeViewController.canSendMail() {
            print("No mail account found")
            return
        }
        
        let picker = MFMailComposeViewController()
        
        picker.setSubject(subject)
        picker.setToRecipients([to])
        picker.setMessageBody(body, isHTML: false)
        picker.mailComposeDelegate = self
        
        EmailUtils.getRootViewController()?.present(picker, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        EmailUtils.getRootViewController()?.dismiss(animated: true, completion: nil)
    }
    
    static func getRootViewController() -> UIViewController? {
        UIApplication.shared.windows.first?.rootViewController
    }
}

// MARK: - Usage
/*

 Button {
 
 EmailUtils.shared.sendEmail(subject: "Greeting", body: "Hello World", to: vitya87ua@gmail.com)
 
 } label: {
     Text("Send Email")
         .font(.robotoBold(size: 18))
         .frame(height: 48)
         .padding(.horizontal, 93)
         .background(Color.pastelYellow)
         .cornerRadius(12)
 }
 
 */
