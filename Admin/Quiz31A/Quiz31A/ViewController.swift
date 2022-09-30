//
//  ViewController.swift
//  Quiz31A
//
//  Created by tj on 2022/08/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNum1: UITextField!
    @IBOutlet weak var tfNum2: UITextField!
    @IBOutlet weak var tfAdd: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMessage.text = "환영합니다!"
    }

    @IBAction func btnAddCalc(_ sender: UIButton) {
        // nil체크해서 에러메세지 출력
        let check = nilCheck()
        // 짝수 계산
        if check {
            evenCalc(tfNum1.text! , tfNum2.text!)
        }
    }
    
    func nilCheck() -> Bool{
        lblMessage.text = tfNum1.text!.isEmpty == true ? "첫번째 숫자를 입력하세요" :
                          tfNum2.text!.isEmpty == true ? "두번째 숫자를 입력하세요" : " "
        if lblMessage.text == " " {
            return ( Int(tfNum1.text!)! % 2 == 0 && Int(tfNum2.text!)! % 2 == 0 ) ? true : false
        }else{
            return false
        }
        
    }
    
    func evenCalc(_ strNum1 : String , _ strNum2 : String){
        let num1 = Int(strNum1)
        let num2 = Int(strNum2)
        tfAdd.text = (num1! % 2 == 0 && num2! % 2 == 0 ) ? String(num1! + num2!) : " "
        
        
    }
}

