//
//  ViewController.swift
//  Quiz05
//
//  Created by TJ on 2022/07/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var gugudan: UITextView!
    @IBOutlet weak var lberror: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gugudan.isEditable = false // read Only
    }

    @IBAction func btnPrint(_ sender: UIButton) {
        lberror.text?.removeAll() // 에러 메세지 초기화
//        gugudan.text.removeAll() // 텍스트 뷰 초기화 , 주석 있으면 단 1개만 출력 , 주석 해제하면 단 누적 출력
        // nil 체크
        let check = nilCheck()
        
        if check{ // 값이 있으면 true
            let dan = Int(tfInput.text!)! // 구구단
            for i in 1...9{
                gugudan.text += "\(dan)X\(i)= \(dan*i) \n"
            }
            gugudan.text += "- - - - - - - - -\n" // 단 구분
            tfInput.text?.removeAll() // 입력창 초기화
        }else{
            lberror.text = "숫자를 입력하세요!" // 하단 에러메세지
        }
    }
    
    // nil 체크 함수 만들기
    func nilCheck() -> Bool{
        let check = tfInput.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if check.isEmpty {
            return false
        }else {
            return true
        }
    } // nilcheck
}

