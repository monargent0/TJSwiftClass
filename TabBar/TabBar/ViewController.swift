//
//  ViewController.swift
//  TabBar
//
//  Created by TJ on 2022/08/21.
//

import UIKit
// Tabbar는 동시에 활성화되어있다!
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
// Tabbar 화면순서도 index와 똑같다 0번부터 시작
    @IBAction func btnGoImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func btnGoDatePicker(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    
}

