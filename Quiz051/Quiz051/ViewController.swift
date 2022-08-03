//
//  ViewController.swift
//  Quiz051
//
//  Created by TJ on 2022/07/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    var imgOn:UIImage?  // 켜진 전구 이미지
    var imgOff:UIImage? // 꺼진 전구 이미지
    @IBOutlet weak var btnRe: UISwitch!
    @IBOutlet weak var imgCenter: UIImageView! // 가운데에서 시작
    @IBOutlet weak var btnCen: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 이미지 파일 연결
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        // imgView에 이미지 할당
//        imgView.image = imgOn
        btnRe.isOn = false
        
        // 가운데에서 사진 확대축소용
        imgCenter.image = imgOn
        btnCen.isOn = false
    }
    // 전구 확대
    @IBAction func btnResize(_ sender: UISwitch) {
        // 이미지 크기를 2배로
        let scale : CGFloat = 2.0
        var newWidth : CGFloat
        var newHeight : CGFloat
        
        switch sender.isOn{
        case true:
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            
        default:
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        
    }
    
    // 전구 스위치
    @IBAction func btnOnOff(_ sender: UISwitch) {
        switch sender.isOn{
        case true:
            imgView.image = imgOn
        default:
            imgView.image = imgOff
        }
    }
    
    // 이미지 가운데에서 시작 확대
    @IBAction func btnCenter(_ sender: UISwitch) {
        // 이미지 크기를 2배로
        let scale : CGFloat = 2.0
        var newWidth : CGFloat
        var newHeight : CGFloat
        var newX : CGFloat = 0
        var newY : CGFloat = 0
        
        switch sender.isOn{
        case true:
            newWidth = imgCenter.frame.width * scale
            newHeight = imgCenter.frame.height * scale
            newX = CGFloat(imgCenter.frame.minX.exponent) - (imgCenter.frame.width / scale)
            newY = CGFloat(imgCenter.frame.minY.exponent) - (imgCenter.frame.height / scale)
        default:
            newWidth = imgCenter.frame.width / scale
            newHeight = imgCenter.frame.height / scale
            newX = CGFloat(imgCenter.frame.minX.exponent) + (newWidth / scale)
            newY = CGFloat(imgCenter.frame.minY.exponent) + (newHeight / scale)
        }
        imgCenter.frame.size = CGSize(width: newWidth, height: newHeight)
        imgCenter.frame.origin = CGPoint(x: newX, y: newY)
    }
    
}

