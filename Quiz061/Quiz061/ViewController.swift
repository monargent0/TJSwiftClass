//
//  ViewController.swift
//  Quiz061
//
//  Created by TJ on 2022/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nextImg: UIImageView! // 다음 이미지
    @IBOutlet weak var imgView: UIImageView! // 현재 이미지
    @IBOutlet weak var prevImg: UIImageView! // 이전 이미지
    @IBOutlet weak var imgTitle: UILabel! // 이미지 제목
    
    var imageName = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_03.png"]
    var imageIndex = 0 // 인덱스 초기값
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayImg()
    }

    @IBAction func btnNext(_ sender: UIButton) {
        imageIndex += 1
        displayImg()
        
    }
    @IBAction func btnPrev(_ sender: UIButton) {
        imageIndex -= 1
        displayImg()
    }
    // 규칙
    // i - 1 = (i+4) % 5
    // i = 0~4
    // i + 1 = (i+1) % 5
    
    // 이미지 뷰 함수
    func displayImg(){
        if imageIndex == imageName.count{
            imageIndex = 0
        } // 마지막 사진 지나면 첫 사진으로
        if imageIndex < 0{
            imageIndex = imageName.count - 1 
        } // 처음 사진으로 가면 마지막 사진으로
        imgTitle.text = imageName[imageIndex]
        prevImg.image = UIImage(named: imageName[(imageIndex+(imageName.count-1))%imageName.count])
        imgView.image = UIImage(named: imageName[imageIndex])
        nextImg.image = UIImage(named: imageName[(imageIndex+1)%imageName.count])
       
    }
}//ViewController

