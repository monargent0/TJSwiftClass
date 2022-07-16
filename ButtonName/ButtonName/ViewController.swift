//
//  ViewController.swift
//  ButtonName
//
//  Created by TJ on 2022/07/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbText: UILabel!
    var count:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnName(_ sender: UIButton) {
        let myName = " 오정은"
        
        if(count == 0){
            lbText.text! += myName
            count += 1
        }else{
            lbText.text = "Welcome!"
            count = 0
        }
        
     }
}

