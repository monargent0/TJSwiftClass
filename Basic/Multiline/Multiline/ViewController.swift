//
//  ViewController.swift
//  Multiline
//
//  Created by TJ on 2022/07/31.
//

import UIKit

class ViewController: UIViewController {
    // 화면이 바뀌는건 아웃렛을 써야한다. 버튼 색을 바꾸거나 글자를 바꾸려면 버튼 아웃렛을 추가해야한다!
    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var tvResult: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvResult.isEditable = false // Textview Read Only (편집 불가)
    }

    @IBAction func btnPrint(_ sender: UIButton) {
        // tfInput에 nil 여부 체크
        let numCheck = checkNil()
        if numCheck{
            tvResult.text += tfInput.text! + "\n" // 한 줄 띄우기도 누적
            tfInput.text?.removeAll() // 누적한 후 텍스트필드 초기화
        }
        
    }
    
    // nil check 함수 만들기
    func checkNil()-> Bool{
        let check = tfInput.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if check.isEmpty{
            return false
        }else{
            return true
        }
    }
} // viewcontroller

