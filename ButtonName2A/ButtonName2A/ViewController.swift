//
//  ViewController.swift
//  ButtonName2A
//
//  Created by tj on 2022/08/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbEmoji: UILabel!
    var emoji = "😄"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbEmoji.text = "이곳에 Emoji가 출력됩니다."
    }

    @IBAction func btnSmile(_ sender: UIButton) {
        lbEmoji.text! = emoji
        emoji += "😄"
    }
    
}

