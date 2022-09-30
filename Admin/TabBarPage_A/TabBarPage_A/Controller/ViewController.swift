//
//  ViewController.swift
//  TabBarPage_A
//
//  Created by tj on 2022/09/03.
//

import UIKit

class ViewController: UIViewController {

    // viewDidLoad보다 먼저 실행된다. 레이아웃 디자인에 관련된 설정하는 곳
    override func viewWillLayoutSubviews() {
        let kBarHeight : Double = 100.0
        self.tabBarController!.tabBar.frame.size.height = kBarHeight
        // 크기를 정했으면 기본적으로 위치도 바꿔주어야 한다.
        self.tabBarController?.tabBar.frame.origin.y = view.frame.height - kBarHeight
    }
    
    // viewDid는 디자인이 아니다.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

