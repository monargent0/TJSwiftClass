//
//  ViewController.swift
//  Quiz02A
//
//  Created by tj on 2022/08/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNumOne: UITextField!
    @IBOutlet weak var tfNumTwo: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var tfAdd: UITextField!
    @IBOutlet weak var tfSub: UITextField!
    @IBOutlet weak var tfMul: UITextField!
    @IBOutlet weak var tfDivQ: UITextField!
    @IBOutlet weak var tfDivR: UITextField!
    
    var numOne : Int = 0
    var numTwo : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Message 정리하기
        lblMessage.text = "환영합니다!"
        
        // 결과부분 Read Only로 만들기
        readOnly()
    }
    
    func readOnly(){
        tfAdd.isUserInteractionEnabled = false
        tfSub.isUserInteractionEnabled = false
        tfMul.isUserInteractionEnabled = false
        tfDivQ.isUserInteractionEnabled = false
        tfDivR.isUserInteractionEnabled = false
    }

    @IBAction func btnCalc(_ sender: UIButton) {
        guard let strNum1 = tfNumOne.text else {return}
        guard let strNum2 = tfNumTwo.text else {return }
        let num1Check : Int = checkNil(strNum1)
        let num2Check : Int = checkNil(strNum2)
        
        if num1Check + num2Check != 2{
            lblMessage.text = "숫자를 입력하세요!"
        }else{
            lblMessage.text = ""
            //계산
            claculation(num1: strNum1, num2: strNum2)
            lblMessage.text = "계산이 완료 되었습니다."
        }
    }
    
    func claculation(num1 : String, num2 : String){
        let intNum1 : Int = Int(num1)!
        let intNum2 : Int = Int(num2)!
        
        tfAdd.text = String(intNum1 + intNum2)
        tfSub.text = String(intNum1 - intNum2)
        tfMul.text = String(intNum1 * intNum2)
        tfDivQ.text = intNum2 == 0 ? "fail" : String(intNum1 / intNum2)
        tfDivR.text = intNum2 == 0 ? "fail" : String(intNum1 % intNum2)
    }
    
    func checkNil(_ str : String) -> Int{
        let check = str.trimmingCharacters(in: .whitespacesAndNewlines)
        if check.isEmpty{
            lblMessage.text = "숫자를 확인해주세요!"
            return 0
        }else{
            return 1
        }
    }
    
    // 아무곳이나 눌러 softkeyboard 지우기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

