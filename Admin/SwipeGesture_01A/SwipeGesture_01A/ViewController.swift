//
//  ViewController.swift
//  SwipeGesture_01A
//
//  Created by tj on 2022/09/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgLeft: UIImageView!
    @IBOutlet weak var imgRight: UIImageView!
    var imgNameLeft = ["arrow-left-black.png","arrow-left-red.png"]
    var imgNameRight = ["arrow-right-black.png","arrow-right-red.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Gesture 만들기
        makeTouch()
        
        // 첫화면 구성
        imgLeft.image = UIImage(named: imgNameLeft[0])
        imgRight.image = UIImage(named: imgNameRight[0])
    }
    
    func makeTouch(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        // 사용자의 행동에 대한 정의
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        // 사용자의 행동에 대한 정의
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        //- 위로 스와이핑 : 행동은 인식하되 반응은 없다
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
    }//
    
    // Gesture Action 반응 // 사용자가 반응을 일으키면 이 scope로 들어옴
    @objc func respondToSwipeGesture(_ gesture : UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            imgLeft.image = UIImage(named: imgNameLeft[0])
            imgRight.image = UIImage(named: imgNameRight[0])
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left :
                imgLeft.image = UIImage(named: imgNameLeft[1])
            case UISwipeGestureRecognizer.Direction.right :
                imgRight.image = UIImage(named: imgNameRight[1])
            case UISwipeGestureRecognizer.Direction.up :
                imgLeft.image = UIImage(named: imgNameLeft[1])
                imgRight.image = UIImage(named: imgNameRight[1])
            default :
                break
            }
        }
    }//objc

}// viewController

