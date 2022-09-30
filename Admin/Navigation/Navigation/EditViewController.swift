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
    @IBOutlet weak var swIsOn: UISwitch!
    
    // viewController에서 넣어줌 ---
    var textWayValue : String = ""
    var textMassage : String = ""
    
    var delegate : EditDelegate?
    var isOn : Bool = false
    //---------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblWay.text = textWayValue
        tfMessage.text = textMassage
        
        swIsOn.isOn = isOn
        
        if isOn{
            lblOnOff.text = "On"
        }else{
            lblOnOff.text = "Off"
        }
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        // viewController 기능 delegate로 연결되어있음
        delegate?.didMessageEditDone(self, message: tfMessage.text!)
        delegate?.didImageOnOffDone(self, isOn: isOn)
        // viewcontroller extension에 있는게 실행됨. view도 죽은게 아니라 아래화면에 숨어있는것이기 때문
        
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
    }
}//
