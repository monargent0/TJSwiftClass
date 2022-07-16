//
//  ViewController.swift
//  Computer
//
//  Created by TJ on 2022/07/16.
//

import UIKit

class ViewController: UIViewController {
// 주는건 뷰디드 위에

    @IBOutlet weak var tfName: UITextField! // ! : optional (null해결을 위함), tfName : 전역변수 , weak / strong : 앱이 백으로 들어갔을때 데이터가 없어지면 weak , 남아있으면 strong인데 ios업그레이드 되며 구분의미가 없어졌다.
    @IBOutlet weak var tfSize: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfBag: UITextField!
    @IBOutlet weak var tfColor: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // 지역변수
//        tfName.text = "안녕하세요" //
    } // 화면이 뜨기전에 실행되는 Function, 화면이 한번 뜨면 다시 실행되지 않는다.

    @IBAction func btnOK(_ sender: UIButton) { // () parameter 매개변수
        let pcName: String = "맥북 프로"
        let pcSize : Int = 16
        let pcWeight: Double = 2.56
        let pcBag:Bool = false
        let pcColor:Character = "백"
        
        tfName.text = pcName
        tfSize.text = String(pcSize)
        tfWeight.text = String(pcWeight)
        tfBag.text = String(pcBag)
        tfColor.text = String(pcColor)
        
        tfName.textColor = UIColor.blue

    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        tfName.text = ""
        tfName.text?.removeAll()
        tfSize.text?.removeAll()
        tfWeight.text?.removeAll()
        tfBag.text?.removeAll()
        tfColor.text?.removeAll()
    }
    
    // 아무곳이나 눌러 softkeyboard 지우기 // 제일 밖 class 안에 만 두기 , 위치 상관 없음
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
// 받는건 뷰디드 아래에
}

