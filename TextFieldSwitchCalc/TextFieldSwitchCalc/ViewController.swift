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
    // 계산결과
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
        calc(firstNum, secondNum)
        // 출력
        printResult()
    }
    
    @IBAction func btnRemove(_ sender: UIButton) {
        add = ""
        sub = ""
        mul = ""
        div = ""
        printResult()
        tfFirstNum.becomeFirstResponder()
    }
    
    @IBAction func btnAdd(_ sender: UISwitch) {
        
    }
    
    @IBAction func btnSub(_ sender: UISwitch) {
    }
    
    @IBAction func btnMul(_ sender: UISwitch) {
    }
    
    @IBAction func btnDiv(_ sender: UISwitch) {
    }
    
    // 계산 함수
    func calc(_ num1 : Int , _ num2 : Int) {
//        swAdd.isOn 
        add = String(num1 + num2)
        sub = String(num1 - num2)
        mul = String(num1 * num2)
        div = num2 == 0 ? "impossible" : String(Double(num1) / Double(num2))
    }// calc
    
    // 출력 함수
    func printResult(){
        tfAddResult.text = add
        tfSubResult.text = sub
        tfMulResult.text = mul
        tfDivResult.text = div
    }//printResult
}//viewcontroller

