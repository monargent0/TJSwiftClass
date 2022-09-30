//
//  ViewController.swift
//  Quiz01
//
//  Created by TJ on 2022/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbName: UILabel!
    var togle : Bool = false
//    var count : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbName.text = "Welcome!"
    }

    @IBAction func btnName(_ sender: UIButton) {
        if togle == false{
            lbName.text = "Welcome! 오정은"
            togle = true
        }else{
            lbName.text = "Welcome!"
            togle = false
        }
        
        //---------강사님 1
//        if count % 2 == 0{
//            lbName.text = "Welcome! 오정은"
//        }else{
//            lbName.text = "Welcome!"
//        }
//        count += 1
        //----------강사님 2
//        if lbName.text == "Welcome!"{
//            lbName.text = "Welcome! 오정은"
//        }else{
//            lbName.text = "Welcome!"
//        }
    }
    
}

