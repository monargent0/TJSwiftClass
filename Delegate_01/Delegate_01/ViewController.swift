//
//  ViewController.swift
//  Delegate_01
//
//  Created by TJ on 2022/08/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tfInput.delegate = self // 밑에서 만든 viewController extension을 tfinput에 기능 추가
        // 이걸 꼭 써야 사용할 수 있다.
    }

    @IBAction func btnAction(_ sender: UIButton) {
        lbResult.text = tfInput.text
    } // btn
    
} // viewController

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        lbResult.text = tfInput.text
        return true
    }
} // extension
