//
//  GVViewController.swift
//  Quiz14-01_A
//
//  Created by tj on 2022/09/04.
//

import UIKit
import WebKit

class GVViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.navigationDelegate = self
//        loadWebPage(url: "https://www.google.com")
        
        // Struct의 함수를 이용한 Web구성
        let site: SiteRequest = SiteRequest() // 인스턴스, 생성자
        let myRequest = site.loadWebPage(url: "https://www.google.com")
        myWebView.load(myRequest)
    }
    
//    // html 불러오기
//    func loadWebPage(url : String){
//        let myUrl = URL(string: url)
//        let myRequest = URLRequest(url: myUrl!)
//        myWebView.load(myRequest)
//    }// -> struct로 대체

}//GVC
//extension
extension GVViewController : WKNavigationDelegate {
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
