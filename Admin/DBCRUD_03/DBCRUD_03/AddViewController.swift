//
//  AddViewController.swift
//  DBCRUD_03
//
//  Created by TJ on 2022/10/02.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var tfCode: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnInsert(_ sender: UIButton) {
        let code = tfCode.text!
        let name = tfName.text!
        let dept = tfDept.text!
        let phone = tfPhone.text!
        
        if !code.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            // 정상
            let insertModel = InsertModel()
            let result = insertModel.insertItems(code: code, name: name, dept: dept, phone: phone)
            
            if result == true{
                // 정상 작동
                let resultAlert = UIAlertController(title: "완료", message: "입력이 되었습니다.", preferredStyle: .actionSheet)
                let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                    self.navigationController?.popViewController(animated: true)
                })
                
                resultAlert.addAction(onAction)
                present(resultAlert, animated: true, completion: nil)
            }else{
                // insert 실패
                let resultAlert = UIAlertController(title: "실패", message: "에러가 발생 되었습니다.", preferredStyle: .alert)
                let onAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                resultAlert.addAction(onAction)
                present(resultAlert, animated: true, completion: nil)
            }
        }else{
            // empty
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
