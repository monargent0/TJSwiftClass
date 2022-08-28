//
//  ViewController.swift
//  Quiz062A
//
//  Created by tj on 2022/08/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblImgName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnPrevImg(_ sender: UIButton) {
        
    }
    
    @IBAction func btnNextImg(_ sender: UIButton) {
        
    }
    
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
    } // display
}

