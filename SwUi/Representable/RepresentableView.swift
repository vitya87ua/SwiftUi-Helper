//
//  RepresentableView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 29.12.2021.
//

import Foundation
import WebKit
import SwiftUI

// MARK: - This is only example! It is not working element!
// This view with Coordinator (WebViewHelper)

struct WebView: UIViewRepresentable {
    
    var image: String
    
    @State var isLoading = true {
        didSet {
            print(#fileID, #line, "isLoading", isLoading)
        }
    }
    
    func makeUIView(context: Context) -> WKWebView {
        
        let preferences = WKPreferences()
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        let webView = WKWebView(frame: CGRect.zero, configuration: configuration)
        
        webView.navigationDelegate = context.coordinator
        webView.contentMode = .scaleAspectFit
        webView.isOpaque = false
        webView.scrollView.isScrollEnabled = false
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        DispatchQueue.main.async {
            webView.loadHTMLString(image, baseURL: nil)
        }
    }
    
    func makeCoordinator() -> WebViewHelper {
        WebViewHelper(self)
    }
    
    class WebViewHelper: NSObject, WKNavigationDelegate {
        
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("webview didFinishNavigation")
            parent.isLoading = false
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            print("didStartProvisionalNavigation")
            parent.isLoading = true
        }
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            print("webviewDidCommit")
        }
        
        func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
            print("didReceiveAuthenticationChallenge")
            completionHandler(.performDefaultHandling, nil)
        }
    }
}

