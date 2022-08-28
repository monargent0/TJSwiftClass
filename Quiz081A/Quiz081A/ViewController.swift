//
//  ViewController.swift
//  Quiz081A
//
//  Created by tj on 2022/08/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbUpImgTitle: UILabel!
    @IBOutlet weak var lbDownImgTitle: UILabel!
    @IBOutlet weak var upImgView: UIImageView!
    @IBOutlet weak var downImgView: UIImageView!
    
    var imageName = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    var upImage = 0 // 인덱스 초기값 위 사진
    var downImage = 0 // 아래 사진
    
    let timeDistance = 3 // 위아래 사진 시간 차이
    let interval = 1.0 // 시간 간격
    let timeSelector : Selector = #selector(ViewController.updateTime) // selector선언 , 코드 단축을 위해서
    // Timer stop
    var timer : Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer() // 타이머 시작
        upImgView.image = UIImage(named: imageName[upImage])
        lbUpImgTitle.text = imageName[upImage]
        downImgView.image = UIImage(named: imageName[downImage / timeDistance])
        lbDownImgTitle.text = imageName[downImage / timeDistance]
    }
    // 타이머시작
    func startTimer(){
        // Timer 설정 (스탑워치, 1초부터 시작)
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    // 타이머 정지
    func stopTimer(){
        timer?.invalidate()
        timer = nil
    }
    
    @objc func updateTime(){
        upImage += 1
        if upImage >= imageName.count{
            upImage = 0
        }
        downImage += 1
        if downImage >= imageName.count * timeDistance{
            downImage = 0
        }
        upImgView.image = UIImage(named: imageName[upImage])
        lbUpImgTitle.text = imageName[upImage]
        downImgView.image = UIImage(named: imageName[downImage / timeDistance])
        lbDownImgTitle.text = imageName[downImage / timeDistance]
        
    }
    
    @IBAction func btnTimerStart(_ sender: UIButton) {
        startTimer()
    }
    
    @IBAction func btnTimerStop(_ sender: UIButton) {
        stopTimer()
    }
}

