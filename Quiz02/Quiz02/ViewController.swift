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
    @IBOutlet weak var calcAdd: UITextField! // 덧셈 결과
    @IBOutlet weak var calcSub: UITextField! // 뺄셈 결과
    @IBOutlet weak var calcMul: UITextField! // 곱셈 결과
    @IBOutlet weak var calcQuotient: UITextField! // 나눗셈 몫
    @IBOutlet weak var calcRemainder: UITextField! // 나눗셈 나머지
    // Message. 라벨
    @IBOutlet weak var lbMessage: UILabel! // 환영/경고 메세지
    @IBOutlet weak var lbQuo: UILabel! // 몫 Hidden용 (분모가 0일 때)
    @IBOutlet weak var lbRem: UILabel! // 나머지 Hidden용
    @IBOutlet weak var lbDiv: UILabel! // 나눗셈결과 Hidden용
    
    // 첫 화면 구성
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 환영메세지 출력
        lbMessage.text = "* Welcome! *"
        
        // 결과 부분 Text Field를 read Only로 변환
        calcAdd.isUserInteractionEnabled = false
        calcSub.isUserInteractionEnabled = false
        calcMul.isUserInteractionEnabled = false
        calcQuotient.isUserInteractionEnabled = false
        calcRemainder.isUserInteractionEnabled = false
        // 추후 입력이 필요할때는 true로 바꾸는 코드를 넣어주면 된다.
    }

    @IBAction func btnClac(_ sender: UIButton) {
        // 숫자 입력하지 않을 시 경고 출력 (빨간색으로 글자색 변경)
        // 키보드 입력창에 스페이스가 없으니 trim 안해도 괜찮음
        if (tfFirst.text!.isEmpty) {
            tfFirst.becomeFirstResponder() // 커서 위치 조정하기
            lbMessage.text = "첫번째 숫자를 입력하세요!"
            lbMessage.textColor = UIColor.red
        }else if (tfSecond.text!.isEmpty) {
            tfSecond.becomeFirstResponder() // 커서 위치 조정하기
            lbMessage.text = "두번째 숫자를 입력하세요!"
            lbMessage.textColor = UIColor.red
        }else{
            calcAdd.text! = String(Int(tfFirst.text!)! + Int(tfSecond.text!)!)
            calcSub.text! = String(Int(tfFirst.text!)! - Int(tfSecond.text!)!)
            calcMul.text! = String(Int(tfFirst.text!)! * Int(tfSecond.text!)!)
            // 나눗셈 계산 (0 에러 체크)
            if tfSecond.text == "0" {
                // Case 1 : tf에 계산 불가 문구 뜨기
//                (calcQuotient.text , calcRemainder.text) = ("계산이 불가합니다." , "계산이 불가합니다.")
                //---
                // Case 2 :  나눗셈 관련 라벨, 텍스트필드 숨기기
//                lbQuo.isHidden = true
//                lbRem.isHidden = true
//                lbDiv.isHidden = true
//                calcQuotient.isHidden = true
//                calcRemainder.isHidden = true
                // isHidden for문으로 하기
                for label in [lbQuo, lbRem, lbDiv, calcQuotient, calcRemainder]{
                    label?.isHidden = true
                }
                //---
            }else {
                // 정상 결과일때 Hidden 풀어주기
                for label in [lbQuo,lbRem,lbDiv,calcQuotient,calcRemainder]{
                    label?.isHidden = false
                }
                calcQuotient.text! = String(Int(tfFirst.text!)! / Int(tfSecond.text!)!)
                calcRemainder.text! = String(Int(tfFirst.text!)! % Int(tfSecond.text!)!)
              
            }
            // 계산완료 멘트 출력
            lbMessage.text = "계산이 되었습니다!"
            lbMessage.textColor = UIColor.systemMint
         
        }
    } // btnClac 계산하기 버튼
    
    @IBAction func btnReset(_ sender: UIButton) {
        // 전체 TextField 비우기
        for tf in [tfFirst, tfSecond, calcAdd, calcSub, calcMul, calcQuotient, calcRemainder]{
            tf!.text?.removeAll()
        }
        // 환영메세지 출력
        lbMessage.text = "* Welcome! *"
        lbMessage.textColor = UIColor.systemMint
        // 숨겨져있을떄 Hidden 풀어주기
        if lbDiv.isHidden == true {
            for label in [lbQuo,lbRem,lbDiv,calcQuotient,calcRemainder]{
                label?.isHidden = false
            }
        }
    } // btnReset
    
    // 아무곳이나 눌러 softkeyboard 지우기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
} // ViewController

