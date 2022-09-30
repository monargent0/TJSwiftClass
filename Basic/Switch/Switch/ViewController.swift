//
//  ViewController.swift
//  Switch
//
//  Created by TJ on 2022/07/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfKor: UITextField!
    @IBOutlet weak var tfMath: UITextField!
    @IBOutlet weak var tfEng: UITextField!
    @IBOutlet weak var lbMessage: UILabel!
    
    var score = [90,80,70,60,0]
    var grade = ["수","우","미","양","가"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbMessage.text = "환영합니다! \n점수를 입력하여 편하게 계산해보세요!"
    }

    @IBAction func btnCalc(_ sender: UIButton){
        guard let kor = tfKor.text else { return }
        guard let mat = tfMath.text else { return }
        guard let eng = tfEng.text else { return }
        
        if kor.isEmpty || mat.isEmpty || eng.isEmpty {
            inputError(kor: kor, mat: mat)
        }else{
            let avg = (Double(kor)! + Double(mat)! + Double(eng)!) / 3
            //
            for i in 0..<score.count{
                if avg >= Double(score[i]){
                    lbMessage.text = "평균은 \(String(format: "%.2f", avg)) 이고 등급은 \(grade[i])입니다."
                    break
                }
            }
        }
        
    }// btn
    
    @IBAction func btnCalc2(_ sender: UIButton) {
        guard let kor = tfKor.text else { return }
        guard let mat = tfMath.text else { return }
        guard let eng = tfEng.text else { return }
        
        if kor.isEmpty || mat.isEmpty || eng.isEmpty {
            inputError(kor: kor, mat: mat)
        }else{
            let avg = (Double(kor)! + Double(mat)! + Double(eng)!) / 3
           
            var grade1 : String = ""
            grade1 = avg >= 90 ? "수" :
                    avg >= 80 ? "우" :
                    avg >= 70 ? "미" :
                    avg >= 60 ? "양" : "가"
            lbMessage.text = "평균은 \(String(format: "%.2f", avg)) 이고 등급은 \(grade1)입니다."
        }
    }
    
    func inputError(kor : String , mat : String){
        let subject = kor.isEmpty ? "국어" :
                      mat.isEmpty ? "수학" : "영어"
        lbMessage.text = "\(subject)의 점수를 입력해 주세요."
    }// btn2
    
} // view

