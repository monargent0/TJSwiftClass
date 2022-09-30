//
//  ViewController.swift
//  Quiz14-01_A
//
//  Created by tj on 2022/09/04.
//

import UIKit

class ViewController: Sites {
//
//    @IBOutlet weak var myWebView: WKWebView!
//    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
//
    override func viewDidLoad() {
        super.viewDidLoad()
//        myWebView.navigationDelegate = self
//        loadWebPage(url: "https://www.naver.com")
    
//        // Struct의 함수를 이용한 Web구성
//        let site: SiteRequest = SiteRequest() // 인스턴스, 생성자
//        let myRequest = site.loadWebPage(url: "https://www.naver.com")
//        myWebView.load(myRequest)
        
        // 최종 상속버전
        siteName = "https://www.naver.com"
        load()
        
    }
//    // html 불러오기
//    func loadWebPage(url : String){
//        let myUrl = URL(string: url)
//        let myRequest = URLRequest(url: myUrl!)
//        myWebView.load(myRequest)
//    }//모든 뷰컨트롤러에서 공통이므로 class/Struct를 만들어 사용- swift파일사용

}// VC

//
////extension
//extension ViewController : WKNavigationDelegate {
//    // Indicator 시작
//    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
//        myActivityIndicator.startAnimating()
//        myActivityIndicator.isHidden = false
//    }
//    // Indicator 종료
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        myActivityIndicator.stopAnimating()
//        myActivityIndicator.isHidden = true
//    }
//    // 에러 발생
//    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        myActivityIndicator.stopAnimating()
//        myActivityIndicator.isHidden = true
//    }
//}
