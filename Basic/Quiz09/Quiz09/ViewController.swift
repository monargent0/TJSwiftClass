//
//  ViewController.swift
//  Quiz09
//
//  Created by TJ on 2022/08/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var pickerDan: UIPickerView!
    @IBOutlet weak var tvGugudan: UITextView!
    let col_num = 1
    let dan = [Int](2...9)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerDan.dataSource = self
        pickerDan.delegate = self
        
        //---
        lbTitle.text = "\(dan[0]) 단"
        calcDan(dan[0])
    }
    // 계산 함수
    func calcDan(_ dan : Int){
        tvGugudan.text = ""
        for i in 1...9{
            tvGugudan.text += "\(dan) \tX\t \(i)\t = \t\(dan*i)\n"
        }
    }

}//ViewController

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return col_num
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dan.count
    }
} // DataSource

extension ViewController : UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(dan[row]) + " 단"
    }
    //
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lbTitle.text = String(dan[row]) + " 단"
        calcDan(dan[row])
    }
} // Delegate
