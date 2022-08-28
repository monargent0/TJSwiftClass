//
//  ViewController.swift
//  Quiz061A
//
//  Created by tj on 2022/08/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblImgName: UILabel!
    @IBOutlet weak var nextImgView: UIImageView!
    @IBOutlet weak var imgView: UIImageView!
    
    var imageName = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_03.png"]
    var imageIndex = 0 // 인덱스 초기값
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayImg()
        
        // Pinch Setup
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_ :)))
        self.view.addGestureRecognizer(pinch)
    }
    @objc func doPinch(_ pinch : UIPinchGestureRecognizer){
        nextImgView.transform = nextImgView.transform.scaledBy(x: pinch.scale , y: pinch.scale)
        // 과거 사이즈는 잊고 현재 이미지에서 확대를 적용한다 (분석에서 마르코프 체인)
        pinch.scale = 1 // 다음 변환을 위해 scale속성을 1로 설정 (현재 확대한 이미지가 1이라고 알려주는 것이다.)
    }
    
    @IBAction func btnNextImg(_ sender: UIButton) {
        imageIndex += 1
        displayImg()
    }
    @IBAction func btnPrevImg(_ sender: UIButton) {
        imageIndex -= 1
        displayImg()
    }
    
    // 이미지 뷰 함수
    func displayImg(){
        if imageIndex == imageName.count{
            imageIndex = 0
        } // 마지막 사진 지나면 첫 사진으로
        if imageIndex < 0{
            imageIndex = imageName.count - 1
        } // 처음 사진으로 가면 마지막 사진으로
        lblImgName.text = imageName[imageIndex]
//        prevImg.image = UIImage(named: imageName[(imageIndex+(imageName.count-1))%imageName.count])
        imgView.image = UIImage(named: imageName[imageIndex])
        nextImgView.image = UIImage(named: imageName[(imageIndex+1)%imageName.count])
    } // display
}

