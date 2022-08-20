//
//  ViewController.swift
//  Hybrid
//
//  Created by TJ on 2022/08/20.
//

import UIKit
import WebKit // <----- 꼭 import해줘야 한다!!
class ViewController: UIViewController {

    @IBOutlet weak var tfUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self // extension
        loadWebPage(url: "https://www.cnn.com") // https: (프로토콜)는 꼭 작성
        tfUrl.text = "https://"
    }
    
    // 인터넷 연결 함수
    func loadWebPage(url:String){
        let myUrl = URL(string: url) // 내 IPaddress등 정보를 포함해서 보냄
        let myRequest = URLRequest(url: myUrl!)
        // html을 다운로드한것을 웹 브라우져가 보여주는것 (다운로드 한 후 보여주는게 기본 포맷이다.)
        myWebView.load(myRequest)
    }
    func checkUrl(_ url : String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("https://")
        
        if !flag{ // hasprefix = false
            strUrl = "https://"+strUrl
        }
        return strUrl
    }
    
    @IBAction func btnGo(_ sender: UIButton) {
        let myUrl = checkUrl(tfUrl.text!)
        tfUrl.text?.removeAll()
        loadWebPage(url: myUrl)
    }
    
    @IBAction func btnSite1(_ sender: UIButton) {
        // https://www.google.com
        loadWebPage(url: "https://www.google.com")
    }
    
    @IBAction func btnSite2(_ sender: UIButton) {
        // https://www.daum.net
        loadWebPage(url: "https://www.daum.net")
    }
    
    @IBAction func btnHtml(_ sender: UIButton) {
        let htmlString = """
            <html>
                <head>
                    <meta charset = "utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 해상도에 맞춰 화면 비율 조정
                </head>
                <body>
                    <h1>HTML String</h1>
                    <p>String변수를 이용한 웹페이지</p>
                    <p><a href = "http://jtbc.joins.com">JTBC</a>로 이동</p>
                </body>
            </html>
        """
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html") // 파일 이름과 형식
        // Bundle이 현제 내 프로젝트를 지칭
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
    }//
    
}// vc

extension ViewController:WKNavigationDelegate{
    // Indicator 시작
    //* didcommit
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    // Indicator 종료
    //* didfinish
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    // Error 발생
    //* didfail
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
}
