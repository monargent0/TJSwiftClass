//
//  ViewController.swift
//  Quiz081
//
//  Created by TJ on 2022/08/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgTitle1: UILabel!
    @IBOutlet weak var imgTitle2: UILabel!
    @IBOutlet weak var imgViewOne: UIImageView!
    @IBOutlet weak var imgViewTwo: UIImageView!
    
    var imageName = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    var imageIndex = 0 // 사진 인덱스 초기값
    var secondIndex = 0 // 두번째 사진 인덱스
    
    let intv = 1.0
    let timeSelector : Selector = #selector(ViewController.updateImg)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: intv , target: self, selector: timeSelector, userInfo: nil, repeats: true)
        displayImg() // 첫 화면 사진 출력
        displaySecondImg()
    }
    // 인덱스 루틴
    // 012345/012345/012345
    // 000111222333444555/000
    
    // 이미지 뷰 함수
    func displayImg(){
        if imageIndex == imageName.count{
            imageIndex = 0
        } // 마지막 사진 지나면 첫 사진으로
        if imageIndex < 0{
            imageIndex = imageName.count - 1
        } // 처음 사진으로 가면 마지막 사진으로
        imgTitle1.text = imageName[imageIndex]
        imgViewOne.image = UIImage(named: imageName[imageIndex])
     
    } // display
    
    // 두번쨰 이미지 뷰 함수
    func displaySecondImg(){
        if secondIndex == imageName.count * 3{ // 3초 사진 인덱스 6이 될때 초기화
            secondIndex = 0
        }
        imgTitle2.text = imageName[secondIndex / 3] // 3초마다 바뀌는 몫으로 인덱스 설정
        imgViewTwo.image = UIImage(named: imageName[secondIndex / 3])
        
        
    } // displaySecondImg
    
    // updateImg
    @objc func updateImg(){
        imageIndex += 1
        secondIndex += 1
        displayImg()
        displaySecondImg()
    }// updateImg

}


