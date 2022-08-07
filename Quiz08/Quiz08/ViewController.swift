//
//  ViewController.swift
//  Quiz08
//
//  Created by TJ on 2022/08/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbImgTitle: UILabel! // 이미지 제목
    @IBOutlet weak var prevImgView: UIImageView! // 이전
    @IBOutlet weak var imgView: UIImageView! // 현재
    @IBOutlet weak var nextImgView: UIImageView! // 다음
    
    var imageName = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    var imageIndex = 0 // 사진 인덱스 초기값
    
    let intv = 3.0 // 0.1초 이런식으로 설정하면 움짤,영상 처럼 보여줄수있다
    let timeSelector : Selector = #selector(ViewController.updateImg)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: intv , target: self, selector: timeSelector, userInfo: nil, repeats: true) // Timer가 곧 async
        displayImg() // 첫 화면 사진 출력
    }
    
    // 이미지 뷰 함수
    func displayImg(){
        if imageIndex == imageName.count{
            imageIndex = 0
        } // 마지막 사진 지나면 첫 사진으로
        if imageIndex < 0{
            imageIndex = imageName.count - 1
        } // 처음 사진으로 가면 마지막 사진으로
        lbImgTitle.text = imageName[imageIndex]
        prevImgView.image = UIImage(named: imageName[(imageIndex + (imageName.count-1) ) % imageName.count])
        imgView.image = UIImage(named: imageName[imageIndex])
        nextImgView.image = UIImage(named: imageName[(imageIndex+1) % imageName.count] )
    } // display
    
    // updateImg
    @objc func updateImg(){
        imageIndex += 1
        displayImg()
    }// updateImg
}

