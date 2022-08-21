//
//  ViewController.swift
//  Quiz18
//
//  Created by TJ on 2022/08/20.
//

import UIKit
import WebKit
// 네트워크 세팅 잊지말기!
class ViewController: UIViewController {
    var siteName = ["네이버","구글","다음","네이트","CNN","야후"]
    var siteUrlList : [String] = ["www.naver.com","www.google.com","www.daum.net","www.nate.com","www.cnn.com","www.yahoo.com"]
    @IBOutlet weak var pickerSite: UIPickerView!
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView.navigationDelegate = self
        
        loadWebPage(url: siteUrlList[0])
        
        pickerSite.dataSource = self
        pickerSite.delegate = self
    }
    // 인터넷 연결 함수
    func loadWebPage(url:String){
        let seturl = "https://" + url
        let myUrl = URL(string: seturl) // 내 IPaddress등 정보를 포함해서 보냄
        let myRequest = URLRequest(url: myUrl!)
        // html을 다운로드한것을 웹 브라우져가 보여주는것 (다운로드 한 후 보여주는게 기본 포맷이다.)
        webView.load(myRequest)
    }
  
    @IBAction func btnGoFoward(_ sender: UIButton) {
        webView.goForward()
    }
    @IBAction func btnGoBack(_ sender: UIButton) {
        webView.goBack()
    }
    

} // vc

// extension
// pickerview 외형
extension ViewController : UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // PickerView의 컬럼 갯수
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return siteUrlList.count
    }
}

// pickerview 기능
extension ViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return siteName[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        loadWebPage(url: "https://"+siteUrlList[row])
    }
}

// indicator
extension ViewController:WKNavigationDelegate{
    // Indicator 시작
    //* didcommit
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myIndicator.startAnimating()
        myIndicator.isHidden = false
    }
    // Indicator 종료
    //* didfinish
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myIndicator.stopAnimating()
        myIndicator.isHidden = true
    }
    // Error 발생
    //* didfail
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myIndicator.stopAnimating()
        myIndicator.isHidden = true
    }
    
}
