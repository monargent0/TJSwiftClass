//
//  ViewController.swift
//  SwipeGesture
//
//  Created by TJ on 2022/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgViewUp: UIImageView!
    @IBOutlet weak var imgViewDown: UIImageView!
    @IBOutlet weak var imgViewLeft: UIImageView!
    @IBOutlet weak var imgViewRight: UIImageView!
    
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    
    let numOfTouches = 2 // 두 손가락
    // 시뮬레이터에서 alt shift 마우스 드래그가 두손가락터치이다
    override func viewDidLoad() {
        super.viewDidLoad()
        // Image 설정하기
        makeImages()
        
        // 초기화면
        imgViewUp.image = imgUp[0]
        imgViewDown.image = imgDown[0]
        imgViewLeft.image = imgLeft[0]
        imgViewRight.image = imgRight[0]
        
        // 한 손가락 Gesture 구성
        makeSingleTouch()
        
        // 두 손가락 Gesture 구성
        makeDoubleTouch()
    }
    
    func makeImages(){
        // index 0
        imgUp.append(UIImage(named: "arrow-up-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgLeft.append(UIImage(named: "arrow-left-black.png")!)
        imgRight.append(UIImage(named: "arrow-right-black.png")!)
        
        // 한 손가락 으로 스와이핑 결과 index 1
        imgUp.append(UIImage(named: "arrow-up-red.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        imgLeft.append(UIImage(named: "arrow-left-red.png")!)
        imgRight.append(UIImage(named: "arrow-right-red.png")!)
        
        // 두 손가락 으로 스와이핑 결과 index 2
        imgUp.append(UIImage(named: "arrow-up-green.png")!)
        imgDown.append(UIImage(named: "arrow-down-green.png")!)
        imgLeft.append(UIImage(named: "arrow-left-green.png")!)
        imgRight.append(UIImage(named: "arrow-right-green.png")!)
    }
    
    func makeSingleTouch(){
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :) ) ) // action = Selector (= Object C)
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :) ) ) // action = Selector (= Object C)
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :) ) ) // action = Selector (= Object C)
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :) ) ) // action = Selector (= Object C)
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    func makeDoubleTouch(){
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_ :) ) ) // action = Selector (= Object C)
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        swipeUp.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_ :) ) ) // action = Selector (= Object C)
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        swipeDown.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_ :) ) ) // action = Selector (= Object C)
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeft.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:) ) ) // action = Selector (= Object C)
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        swipeRight.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func respondToSwipeGesture(_ gesture : UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[1]
            case UISwipeGestureRecognizer.Direction.down:
            imgViewDown.image = imgDown[1]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[1]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[1]
            default: break
        } // 이상이 있으면 if문이 동작하지 않음
    }
    }
   
    @objc func respondToSwipeGestureMulti(_ gesture : UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[2]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[2]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[2]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[2]
            default: break
        } // 이상이 있으면 if문이 동작하지 않음
    }
    }
    
} // ViewController
// 터치스크린 기능 사용 - objectC로 구성되어있다

