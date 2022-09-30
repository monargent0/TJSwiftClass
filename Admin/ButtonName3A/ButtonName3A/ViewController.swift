//
//  ViewController.swift
//  ButtonName3A
//
//  Created by tj on 2022/08/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblEmoji: UILabel!
    var emoji:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblEmoji.text = "Emoji를 눌러주세요!"
    }

    @IBAction func btnEmoji1(_ sender: UIButton) {
        emoji += "🐰"
        lblEmoji.text! = emoji
    }
    
    @IBAction func btnEmoji2(_ sender: UIButton) {
        emoji += "🙅🏻‍♂️"
        lblEmoji.text! = emoji
    }
    
    @IBAction func btnEmoji3(_ sender: UIButton) {
        emoji += "🧚🏻‍♂️"
        lblEmoji.text! = emoji
    }
}

