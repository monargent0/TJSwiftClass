//
//  ViewController.swift
//  Quiz31
//
//  Created by TJ on 2022/07/23.
//

import UIKit

class ViewController: UIViewController {
    // 숫자 입력
    @IBOutlet weak var tfNumOne: UITextField!
    @IBOutlet weak var tfNumTwo: UITextField!
    // 결과
    @IBOutlet weak var tfResult: UITextField!
    @IBOutlet weak var lbMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        tfNumOne.text = nil
//        tfNumTwo.text = nil
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
        // Optional Unwarpping
//        guard let <#constant#> = <#expression#> else { return <#return value#> }
        guard let num1 = tfNumOne.text else {return}
        guard let num2 = tfNumTwo.text else {return}
        // 입력 여부 확인
        if checkInput(num: num1) == 1{
            lbMessage.text! = "1번 숫자를 입력해 주세요!"
        }else if checkInput(num: num2) == 1{
            lbMessage.text! = "2번 숫자를 입력해 주세요!"
        }else{
            // 짝수 판단
            if checkEven(num: num1) == false{
                lbMessage.text! = "1번 숫자를 짝수로 입력해 주세요!"
                tfNumOne.becomeFirstResponder()
            }else if checkEven(num: num2) == false {
                lbMessage.text! = "2번 숫자를 짝수로 입력해 주세요!"
                tfNumTwo.becomeFirstResponder()
            }else{
                // 덧셈 계산
                addiction(num1: num1, num2: num2)
                
            }
        }
        
    }
    
    // 입력 여부 함수
    func checkInput(num : String)-> Int{
        if num.isEmpty{
            return 1
        }else {
            return 0
        }
    }//
    
    // 짝수 판단 함수
    func checkEven(num : String)-> Bool{
        if Int(num)! % 2 == 0{
            return true
        }else{
            return false
        }
    }//
    
    // 더하기 함수
    func addiction(num1 : String , num2:String){
        tfResult.text = String(Int(num1)! + Int(num2)!)
        lbMessage.text! = "계산이 완료 되었습니다."
    }//
    
    // 강사님 함수
    func checkEvenOdd(num1 : Int , num2:Int){
        if num1 % 2 == 0 && num2 % 2 == 0{
            tfResult.text = String(num1 + num2)
            lbMessage.text = "계산이 완료되었습니다."
        }else{
            lbMessage.text = "짝수를 입력 하세요!"
        }
    }
    
    // 아무곳이나 눌러 softkeyboard 지우기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
} //ViewController

