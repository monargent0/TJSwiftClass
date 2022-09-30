//
//  ViewController.swift
//  PinchGesture_01A
//
//  Created by tj on 2022/08/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgPinch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 시뮬레이터에서 이미지 확대 alt (opt) 누르고 드래그
        // Pinch Setup
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_ :)))
        self.view.addGestureRecognizer(pinch)
    }

    @objc func doPinch(_ pinch : UIPinchGestureRecognizer){
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale , y: pinch.scale)
        // 과거 사이즈는 잊고 현재 이미지에서 확대를 적용한다 (분석에서 마르코프 체인)
        pinch.scale = 1 // 다음 변환을 위해 scale속성을 1로 설정 (현재 확대한 이미지가 1이라고 알려주는 것이다.)
    }

}

