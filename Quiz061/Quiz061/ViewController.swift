//
//  ViewController.swift
//  Quiz061
//
//  Created by TJ on 2022/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nextImg: UIImageView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgTitle: UILabel!
    @IBOutlet weak var prevImg: UIImageView!
    
    var imageName = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png"]
    var imageIndex = 0
    
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
    // i - 1 = (i+4) % 5
    // i = 0~4
    // i + 1 = (i+1) % 5
    
    // 이미지 뷰 함수
    func displayImg(){
        if imageIndex == 5{
            imageIndex = 0
        }
        if imageIndex < 0{
            imageIndex = 4
        }
        imgTitle.text = imageName[imageIndex]
        prevImg.image = UIImage(named: imageName[(imageIndex+4)%5])
        imgView.image = UIImage(named: imageName[imageIndex])
        nextImg.image = UIImage(named: imageName[(imageIndex+1)%5])
       
    }
}//ViewController

