//
//  WebView.swift
//  TradingView
//
//  Created by Sirac Seyidov on 20.10.2023.
//

import Foundation
import SwiftUI
import WebKit
 
struct WebView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
        
        let javascriptDarkMode = """
        document.documentElement.setAttribute("data-theme", "dark");
        """
        
        webView.evaluateJavaScript(javascriptDarkMode, completionHandler: nil)
    }
}
