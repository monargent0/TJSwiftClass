//
//  ViewController.swift
//  ButtonName2
//
//  Created by TJ on 2022/07/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbSmile: UILabel!
    
    let smile:Character = "😆"
    var smilePrint : String = "" // 화면에 출력할 글자의 저장소
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbSmile.text?.removeAll()
        lbSmile.text = "이곳에 Emoji가 출력됩니다."
        
    }

    @IBAction func btnSmile(_ sender: UIButton) {
        lbSmile.text = ""
        smilePrint += String(smile)
        lbSmile.text = smilePrint
//        lbSmile.text! += String(smile)
       
    }
    
    @IBAction func btnDel(_ sender: UIButton) {
//        lbSmile.text?.remove(at: lbSmile.text!.startIndex)
        lbSmile.text?.removeLast()
        smilePrint = lbSmile.text!

    }
}

