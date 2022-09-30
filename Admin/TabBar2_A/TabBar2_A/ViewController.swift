//
//  ViewController.swift
//  TabBar2_A
//
//  Created by tj on 2022/09/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnQ08(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func btnQ081(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    

}

