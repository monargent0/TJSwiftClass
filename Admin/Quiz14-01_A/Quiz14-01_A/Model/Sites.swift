//
//  Sites.swift
//  Quiz14-01_A
//
//  Created by tj on 2022/09/04.
//

import UIKit
import WebKit

class Sites: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    var siteName : String = ""
    
    func load() {
        super.viewDidLoad()
        myWebView.navigationDelegate = self
        
        // Struct의 함수를 이용한 Web구성
        let site: SiteRequest = SiteRequest() // 인스턴스, 생성자
        let myRequest = site.loadWebPage(url: siteName)
        myWebView.load(myRequest)
    }

}// VC


//extension
extension Sites : WKNavigationDelegate {
    // Indicator 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    // Indicator 종료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    // 에러 발생
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
}
