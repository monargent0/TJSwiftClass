//
//  ViewController.swift
//  ImageBMI_A
//
//  Created by tj on 2022/08/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    
    let imageName = ["bmi.png","underweight.png","normal.png","risk.png","overweight.png","obese.png" ]
    var imgIndex = 0
    
    // bmi공식 kg / m ^2
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: imageName[imgIndex] )
        lblResult.text = "BMI 공식은 kg/m^2 입니다."
    }

    @IBAction func btnBmiCalc(_ sender: UIButton) {
        let check = nilCheck()
        if check {
            bmiCalc()
        }else{
            lblResult.text = "입력값을 확인해 주세요."
        }
    }
    
    // nil체크 함수
    func nilCheck() -> Bool{
        let strH = tfHeight.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let strW = tfWeight.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if strH?.isEmpty == true || strW?.isEmpty == true {
            return false
        }else{
            return true
        }
    }// nilcheck
    
    func bmiCalc(){
        let height : Int = Int(tfHeight.text!)!
        let weight : Int = Int(tfWeight.text!)!
        
        if height > 130 && height < 230 && weight > 20 && weight < 130{
            let bmi : Double = Double(weight) / ((Double(height) / 100) * (Double(height)/100) )
            var result : String = "" // 결과멘트
            
            switch bmi {
            case 0...18.4 :
                imgIndex = 1
                result = "저체중"
            case 18.5...22.9 :
                imgIndex = 2
                result = "정상체중"
            case 23...24.9 :
                imgIndex = 3
                result = "과체중"
            case 25...29.9 :
                imgIndex = 4
                result = "비만"
            default:
                imgIndex = 5
                result = "고도비만"
            }
            
            imgView.image = UIImage(named: imageName[imgIndex] )
            //lblResult.text = "귀하의 bmi 지수는 \(round(bmi*100)/100)이고 \(result) 입니다."
            let resultAlert = UIAlertController(title: "계산 결과", message: "귀하의 bmi 지수는 \(round(bmi*100)/100)이고 \(result) 입니다.", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "확인", style: .default, handler: nil)
            resultAlert.addAction(actionOk)
            present(resultAlert, animated: true, completion: nil)
            
        }else{
            lblResult.text = "신장과 체중 입력 범위를 벗어나였습니다."
        }
        
    }//bmicalc
    
    // 아무곳이나 눌러 softkeyboard 지우기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

