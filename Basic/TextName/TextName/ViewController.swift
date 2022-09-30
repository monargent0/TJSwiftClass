//
//  ViewController.swift
//  TextName
//
//  Created by TJ on 2022/07/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var lbNotice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbNotice.text = "환영합니다!"
    }
    
    @IBAction func btnSend(_ sender: UIButton) {
        //lbName.text! += tfName.text! // Forced Unwrapping  --- ! (optional) 이 ("글자") -> "글자" ()를 강제로 때냄
        
        //-------------------------------------------------
        if  tfName.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            // whitespaces / Newlines : space / enter
            // tfName.text.count == 0
            // tfName.text?.isEmpty == true
            // tfName.text!.isEmpty // Forced Unwrapping
            lbNotice.text = "이름을 입력하세요!"
            lbNotice.textColor = UIColor.red
        }else{
            lbName.text?.append(tfName.text!)
            lbNotice.text?.removeAll()
        } // if
        
        tfName.text?.removeAll()
        
    }//
    
    @IBAction func btnClear(_ sender: UIButton) {
        lbName.text = "Welcome! "
        tfName.text?.removeAll()
        lbNotice.text?.removeAll()
    }//
}// ViewController
