//
//  EditViewController.swift
//  Navigation01
//
//  Created by tj on 2022/09/04.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var swIsOn: UISwitch! //switch 상태변수
    
    var textWayValue : String = ""
    var isOn : Bool = Message.isOn
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblWay.text = textWayValue
        tfMessage.text = Message.message
        
        swIsOn.isOn = isOn
        if isOn{
            lblOnOff.text = "On"
        }else{
            lblOnOff.text = "Off"
        }
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        Message.message = tfMessage.text!
        
        // 완료 누르면 첫 화면으로 돌아가기 (수정화면 끄기)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
            lblOnOff.text = "On"
        }else{
            isOn = false
            lblOnOff.text = "Off"
        }
        Message.isOn = isOn
    }
    
}//
