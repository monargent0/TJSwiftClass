//
//  ViewController.swift
//  TextFieldSwitchCalc
//
//  Created by TJ on 2022/07/31.
//

import UIKit

class ViewController: UIViewController {
    // 입력
    @IBOutlet weak var tfFirstNum: UITextField!
    @IBOutlet weak var tfSecondNum: UITextField!
    // switch 버튼
    @IBOutlet weak var swAdd: UISwitch!
    @IBOutlet weak var swSub: UISwitch!
    @IBOutlet weak var swMul: UISwitch!
    @IBOutlet weak var swDiv: UISwitch!
    // 결과
    @IBOutlet weak var tfAddResult: UITextField!
    @IBOutlet weak var tfSubResult: UITextField!
    @IBOutlet weak var tfMulResult: UITextField!
    @IBOutlet weak var tfDivResult: UITextField!
    // 계산결과 저장
    var add : String = ""
    var sub : String = ""
    var mul : String = ""
    var div : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnCalc(_ sender: UIButton) {
        let firstNum = Int(tfFirstNum.text!) ?? 0
        let secondNum = Int(tfSecondNum.text!) ?? 0
        // 계산
        calc(firstNum, secondNum) // 전역변수에 계산결과 저장
        // 출력
        printResult()
    }
    
    @IBAction func btnRemove(_ sender: UIButton) {
        // 모두 초기화
        tfFirstNum.text?.removeAll()
        tfSecondNum.text?.removeAll()
        
        add = ""
        sub = ""
        mul = ""
        div = ""
        printResult()
        
        // 첫번째 숫자 입력으로 커서 이동
        tfFirstNum.becomeFirstResponder()

        // 모든 스위치 온으로 변경
        for sw in [swAdd, swSub, swMul, swDiv]{
            sw!.isOn = true
        }
    }
    
    @IBAction func btnAdd(_ sender: UISwitch) {
        tfAddResult.text = swAdd.isOn == false ? "" : add
    }
    
    @IBAction func btnSub(_ sender: UISwitch) {
        tfSubResult.text = swSub.isOn == false ? "" : sub
    }
    
    @IBAction func btnMul(_ sender: UISwitch) {
        tfMulResult.text = swMul.isOn == false ? "" : mul
    }
    
    @IBAction func btnDiv(_ sender: UISwitch) {
        tfDivResult.text = swDiv.isOn == false ? "" : div
    }
    
    // -----------------------------------------------------
    
    // 계산 함수
    func calc(_ num1 : Int , _ num2 : Int) {
        add =  String(num1 + num2)
        sub =  String(num1 - num2)
        mul =  String(num1 * num2)
        div =  num2 == 0 ? "impossible" : String(Double(num1) / Double(num2))
    }// calc
    
    // 출력 함수
    func printResult(){
        tfAddResult.text = swAdd.isOn == false ? "" : add
        tfSubResult.text = swSub.isOn == false ? "" : sub
        tfMulResult.text = swMul.isOn == false ? "" : mul
        tfDivResult.text = swDiv.isOn == false ? "" : div
    }//printResult
    
    // 아무곳이나 눌러 softkeyboard 지우기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}//viewcontroller

