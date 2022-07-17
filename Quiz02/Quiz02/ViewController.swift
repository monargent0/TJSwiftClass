//
//  ViewController.swift
//  Quiz02
//
//  Created by TJ on 2022/07/17.
//

import UIKit

class ViewController: UIViewController {
    // 입력받는 textfield
    @IBOutlet weak var tfFirst: UITextField!
    @IBOutlet weak var tfSecond: UITextField!
    // 계산 결과 출력 textfield
    @IBOutlet weak var calcAdd: UITextField!
    @IBOutlet weak var calcSub: UITextField!
    @IBOutlet weak var calcMul: UITextField!
    @IBOutlet weak var calcQuotient: UITextField!
    @IBOutlet weak var calcRemainder: UITextField!
    // Message. 라벨
    @IBOutlet weak var lbMessage: UILabel!
    @IBOutlet weak var lbQuo: UILabel!
    @IBOutlet weak var lbRem: UILabel!
    @IBOutlet weak var lbDiv: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbMessage.text = "* Welcome! *"
    }

    @IBAction func btnClac(_ sender: UIButton) {
        if (tfFirst.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
            lbMessage.text = "첫번째 숫자를 입력하세요!"
            lbMessage.textColor = UIColor.red
        }else if (tfSecond.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
            lbMessage.text = "두번째 숫자를 입력하세요!"
            lbMessage.textColor = UIColor.red
        }else{
//            let num1:Int = Int(tfFirst.text!)!
//            let num2:Int = Int(tfSecond.text!)!
//            calcAdd.text! = String(num1 + num2)
//            calcSub.text! = String(num1 - num2)
//            calcMul.text! = String(num1 * num2)
//            calcQuotient.text! = String(num1 / num2)
//            calcRemainder.text! = String(num1 % num2)
            calcAdd.text! = String(Int(tfFirst.text!)! + Int(tfSecond.text!)!)
            calcSub.text! = String(Int(tfFirst.text!)! - Int(tfSecond.text!)!)
            calcMul.text! = String(Int(tfFirst.text!)! * Int(tfSecond.text!)!)
            if tfSecond.text == "0" {
//                (calcQuotient.text , calcRemainder.text) = ("계산이 불가합니다." , "계산이 불가합니다.")
//                lbQuo.isHidden = true
//                lbRem.isHidden = true
//                lbDiv.isHidden = true
//                calcQuotient.isHidden = true
//                calcRemainder.isHidden = true
                for label in [lbQuo,lbRem,lbDiv,calcQuotient,calcRemainder]{
                    label?.isHidden = true
                }
                
               
            }else {
                for label in [lbQuo,lbRem,lbDiv,calcQuotient,calcRemainder]{
                    label?.isHidden = false
                }
                calcQuotient.text! = String(Int(tfFirst.text!)! / Int(tfSecond.text!)!)
                calcRemainder.text! = String(Int(tfFirst.text!)! % Int(tfSecond.text!)!)
              
            }
            lbMessage.text = "계산이 되었습니다!"
            lbMessage.textColor = UIColor.systemMint
         
        }
    }
    
    @IBAction func btnReset(_ sender: UIButton) {
        
    }
    
    // 아무곳이나 눌러 softkeyboard 지우기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
} // ViewController

