//
//  ViewController.swift
//  Quiz08A
//
//  Created by tj on 2022/08/28.
//

import UIKit

class Q08ViewController: UIViewController {

    @IBOutlet weak var imgTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var imageName = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_03.png"]
    var numImage = 0 // 인덱스 초기값
    
    let interval = 3.0 // 시간 간격 3초
    let timeSelector : Selector = #selector(Q08ViewController.updateTime) // selector선언 , 코드 단축을 위해서
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Timer 설정 (스탑워치, 1초부터 시작)
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true) //aysnc 비동기 방식 (cpu여러개)
        imgView.image = UIImage(named: imageName[numImage])
        imgTitle.text = imageName[numImage]
    }
    
    @objc func updateTime(){
        numImage += 1
        if numImage >= imageName.count{
            numImage = 0
        }
        imgView.image = UIImage(named: imageName[numImage])
        imgTitle.text = imageName[numImage]
    }

}

