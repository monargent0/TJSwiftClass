//
//  ViewController.swift
//  Quiz02_Func
//
//  Created by TJ on 2022/08/06.
//

import UIKit

class ViewController: UIViewController {
    // 입력
    @IBOutlet weak var tfFirstNum: UITextField!
    @IBOutlet weak var tfSecondNum: UITextField!
    // 출력
    @IBOutlet weak var resultAdd: UITextField!
    @IBOutlet weak var resultSub: UITextField!
    @IBOutlet weak var resultMul: UITextField!
    @IBOutlet weak var resultQuotient: UITextField!
    @IBOutlet weak var resultRemainder: UITextField!
    // 라벨
    @IBOutlet weak var lbMessage: UILabel!
    @IBOutlet weak var lbQuo: UILabel!
    @IBOutlet weak var lbRem: UILabel!
    @IBOutlet weak var lbDiv: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbMessage.text = " * Welcome ! *"
    }

    @IBAction func btnCalc(_ sender: UIButton) {
        let firstNum = Int(tfFirstNum.text!) ?? 0
        let secondNum = Int(tfSecondNum.text!) ?? 0
        
        
    }
    
    

}

