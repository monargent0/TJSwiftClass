//
//  ViewController.swift
//  ImageView
//
//  Created by TJ on 2022/07/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
    
    var imgOn:UIImage?  // 켜진 전구 이미지
    var imgOff:UIImage? // 꺼진 전구 이미지
    
    var isZoom = false // 확대 축소 상태
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 이미지 파일 연결
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        // imgView에 이미지 할당
        imgView.image = imgOn
    }
    
    @IBAction func btnSwitch(_ sender: UISwitch) { // sender가 화면에 있는 상태가 on인지 off인지 알고있다. (T/F값)
        switch sender.isOn{
        case true:
            imgView.image = imgOn
        default:
            imgView.image = imgOff
        }
    }
    
    @IBAction func btnResizeImg(_ sender: UIButton) {
        // 이미지 크기를 2배로
        let scale : CGFloat = 2.0
        var newWidth : CGFloat
        var newHeight : CGFloat
        
        switch isZoom{
        case true:
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            btnResize.setTitle("Image 확대", for: .normal)
        default:
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            btnResize.setTitle("Image 축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    

}

