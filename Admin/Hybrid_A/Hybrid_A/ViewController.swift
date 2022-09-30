//
//  ViewController.swift
//  Hybrid_A
//
//  Created by tj on 2022/09/03.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var tfUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.navigationDelegate = self
        
        // 첫번째 화면 네이버로 시작
        loadWebPage(url: "https://www.naver.com")
        
    }
    // html 불러오기
    func loadWebPage(url : String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnGo(_ sender: UIButton) {
        let myUrl = checkUrl(tfUrl.text!)
        loadWebPage(url: myUrl)
    }
    // 입력한 주소 체크 함수
    func checkUrl(_ url : String)-> String{
        var strUrl = url
        let flag = strUrl.hasPrefix("https://") // Bool
        
        if !flag {
           strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    @IBAction func btnSite1(_ sender: UIButton) {
        // 구글
        loadWebPage(url: "https://www.google.com")
    }
    @IBAction func btnSite2(_ sender: UIButton) {
        // 다음
        loadWebPage(url: "https://www.daum.net")
    }
    @IBAction func btnHtml(_ sender: UIButton) {
        let html = """
            <html>
                <head>
                    <meta charset = "utf-8">
                    <meta name = "viewport" content="width=device-width, initial-scale=1.0">
                </head>
                <body>
                    <h1>HTML String </h1>
                    <p>String변수를 이용한 웹 페이지</p>
                    <p><a href="http://jtbc.joins.com">JTBC</a></p>
                </body>
            </html>
        """
        myWebView.loadHTMLString(html, baseURL: nil)
    }
    @IBAction func btnFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html") // file이름, 확장자
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoFoward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
    // 아무곳이나 눌러 softkeyboard 지우기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}//viewcontroller
//extension
extension ViewController : WKNavigationDelegate {
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

