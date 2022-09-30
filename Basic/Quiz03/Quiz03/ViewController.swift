//
//  ViewController.swift
//  Quiz03
//
//  Created by TJ on 2022/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNum: UITextField! // 숫자 입력
    @IBOutlet weak var lbResult: UILabel! // 결과메세지

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbResult.text! = "환영합니다!"
    }

    @IBAction func btnResult(_ sender: UIButton) {
        // 숫자 미입력시 에러
        if tfNum.text?.isEmpty == true{
            lbResult.text! = "* 숫자를 입력해 주세요! *"
            tfNum.becomeFirstResponder()
        }else{ // 짝수 홀수 계산
            if Int(tfNum.text!)! == 0{
                lbResult.text! = "입력하신 숫자는 0 입니다."
                tfNum.text?.removeAll()
            }else if Int(tfNum.text!)! % 2 == 0{
                lbResult.text! = "입력하신 숫자는 \(tfNum.text!) \n짝수입니다."
                tfNum.text?.removeAll()
            }else{
                lbResult.text! = "입력하신 숫자는 \(tfNum.text!) \n홀수입니다."
                tfNum.text?.removeAll()
            }
        }
    } //btnResult
    
    // 강사님 방식 optional 제거, func사용 <소스 가독성을 높혀 작성>
    @IBAction func btnPlus(_ sender: UIButton) {
        // Optional 처리
        // ! : force wrapping
        // if let : Normal
        // guard let : Normal 제일 늦게 나온거라 그나마 제일 빨라서 요즘에 사용함.
        guard let strInputNumber = tfNum.text else {return} // 만약 nill 이면 return에서 처리된다.
        
        // 입력여부 확인 함수 만들기
        let numCheck = checkNil(str: strInputNumber)
        
        if numCheck == 1 {
            // 홀짝수 판별하기
//            lbResult.text = "입력하신 숫자는 \(numberDecision(str: strInputNumber)) 입니다."
            let returnValue = numberDecision(str: strInputNumber)
            lbResult.text = "입력하신 숫자는 \(returnValue) 입니다."
        }else{
            lbResult.text = "숫자를 확인 하세요!"
        }
        
    }//btnPlus
    
    // 입력여부 Function
    func checkNil(str: String) -> Int{
        if str.isEmpty {
            return 0
        }else{
            return 1
        }
    }//checkNil
    
    // 홀짝수 판별하기 Function
    func numberDecision(str:String) -> String{
        if Int(str)! % 2 == 0{
            return "짝수"
        }else{
            return "홀수"
        }
    }//numberDecision
    
    // 아무곳이나 눌러 softkeyboard 지우기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
} //ViewController

