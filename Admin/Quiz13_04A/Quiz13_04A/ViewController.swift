//
//  ViewController.swift
//  Quiz13_04A
//
//  Created by tj on 2022/09/03.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myPageController: UIPageControl!
    var urlList = ["https://www.kbs.co.kr","https://www.imbc.com","https://www.sbs.co.kr","https://jtbc.co.kr"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // gesture Setting
        makeTouch()
        
        // pageControl Setting
        myPageController.numberOfPages = urlList.count
        myPageController.currentPage = 0
        myPageController.pageIndicatorTintColor = UIColor.cyan
        myPageController.currentPageIndicatorTintColor = UIColor.orange
        
        // Indicator Setting
        myWebView.navigationDelegate = self
        
        // WebView Setting
        loadWebPage(url: urlList[myPageController.currentPage])
    }
    // html 불러오기
    func loadWebPage(url : String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    // Gesture 설정
    func makeTouch(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondSwipe))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondSwipe))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    // Gesture 반응 설정
    @objc func respondSwipe(_ gesture : UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right :
                myPageController.currentPage += 1
                loadWebPage(url: urlList[myPageController.currentPage])
            case UISwipeGestureRecognizer.Direction.left :
                myPageController.currentPage -= 1
                loadWebPage(url: urlList[myPageController.currentPage])
            default :
                break
            }
        }
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        loadWebPage(url: urlList[myPageController.currentPage])
    }
    

}//VC
//extension
extension ViewController : WKNavigationDelegate {
    // Indicator 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myIndicator.startAnimating()
        myIndicator.isHidden = false
    }
    // Indicator 종료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myIndicator.stopAnimating()
        myIndicator.isHidden = true
    }
    // 에러 발생
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myIndicator.stopAnimating()
        myIndicator.isHidden = true
    }
}
