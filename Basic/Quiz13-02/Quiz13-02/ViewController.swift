//
//  ViewController.swift
//  Quiz13-02
//
//  Created by TJ on 2022/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    var images = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 페이지 컨트롤러 설정
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0 // *현제 페이지번호가 자동이다*
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        // 초기화면
        imgShow(pageControl.currentPage)
        
        // 한 손가락 스와이핑
        makeSingleSwipe()
    }

    @IBAction func pageAction(_ sender: UIPageControl) {
        imgShow(pageControl.currentPage)
    }
    // 사진 출력
    func imgShow(_ index : Int){
        imgView.image = UIImage(named: images[index])
    }
    // 한 손 스와이핑 함수
    func makeSingleSwipe(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }//
    // 스와이핑 Action 함수
    @objc func respondToSwipeGesture(_ gesture : UIGestureRecognizer){
        let now = pageControl.currentPage
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                pageControl.currentPage = now + 1
                //pageControl.currentPage = pageControl.currentPage + 1
            case UISwipeGestureRecognizer.Direction.right:
                pageControl.currentPage = now - 1
            default : break
            }
            imgShow(pageControl.currentPage)
        }
    }//objc
    
}//vc

