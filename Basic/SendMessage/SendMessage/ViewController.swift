//
//  ViewController.swift
//  SendMessage
//
//  Created by TJ on 2022/07/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvMessage: UITextView! // 뷰
    @IBOutlet weak var tfInput: UITextField! // 입력
    @IBOutlet weak var e1: UIButton! // 하트
    @IBOutlet weak var e2: UIButton! // 눈물
    @IBOutlet weak var e3: UIButton! // 선글라스
    @IBOutlet weak var lbError: UILabel! // 에러메세지
    var btnState = false // 이모지 버튼 온오프용
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emojiOnOff(true)
    }
    
    @IBAction func btnSend(_ sender: UIButton) {
        lbError.text?.removeAll() // 에러메세지 초기화
        
        // tf nil 체크하기
        let input = nilCheck()
       
        // tv에 입력값 보내기
        if input != ""{
            tvMessage.text += input
            tfInput.text?.removeAll() // 입력창 비움
            emojiOnOff(true)// emoji 숨김
        }else{
            lbError.text = "메세지를 입력해 주세요!"
        }
    }
    
    @IBAction func btnEmoji(_ sender: UIButton) {
        // 버튼 누르면 이모지 켜지고 꺼지게 설정
        if btnState == false{
            emojiOnOff(false)
            btnState = true
        }else {
            emojiOnOff(true)
            btnState = false
        }
    }
    @IBAction func btnE1(_ sender: UIButton) {
        tfInput.text! += "🥰"
    }
    @IBAction func btnE2(_ sender: UIButton) {
        tfInput.text! += "😭"
    }
    @IBAction func btnE3(_ sender: UIButton) {
        tfInput.text! += "😎"
    }
    
    // tf nil check
    func nilCheck() -> String{
        let tf = tfInput.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if tf.isEmpty {
           return ""
        }else {
            return tf+"\n"
        }
    }//nilCheck
    
    // emoji 활성화
    func emojiOnOff(_ onoff : Bool) {
        e1.isHidden = onoff
        e2.isHidden = onoff
        e3.isHidden = onoff
    }//emojiOnOff
    
}//ViewController

