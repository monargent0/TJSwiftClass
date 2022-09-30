//
//  ViewController.swift
//  Quiz13
//
//  Created by TJ on 2022/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbNum: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0 // *현제 페이지번호가 자동이다*
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        lbNum.text = String(pageControl.currentPage + 1)
        textColor(lbNum.text!) // 짝홀 글자 색상 변경
    }

    @IBAction func pageAction(_ sender: UIPageControl) {
        lbNum.text = "\(pageControl.currentPage + 1)"
        textColor(lbNum.text!)
    }
    
    // 짝수 홀수 라벨 글자 색상 변경
    func textColor(_ lb:String){
        lbNum.textColor = Int(lb)!%2==0 ? UIColor.blue : UIColor.red
    }
    
}

