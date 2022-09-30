//
//  ViewController.swift
//  Navigation01
//
//  Created by tj on 2022/09/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
   
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true // 수정화면의 스위치 모양
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = imgOn
        
    }
    
// 세그가 넘겨주기때문에 액션부분이 따로 필요없다
    // tf에 입력한 값을 수정화면으로 넘기고 수정된 값을 받아온다 (세그, Static 사용)
    // 세그 사용
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController // 인스턴스
        
        if segue.identifier == "editButton"{
            // editViewController에 있는 변수(textwayvalue) 사용
            editViewController.textWayValue = "Segue: Use Button"
        }else{
            editViewController.textWayValue = "Segue: Use BarButton"
        }
        
        editViewController.textMassage = tfMessage.text!
        editViewController.delegate = self // extension
        editViewController.isOn = isOn
    }

}// VC

// Delegate 생성
extension ViewController:EditDelegate { // 여기까지만 쓰고 Fix기능 이용해서 
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        tfMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn{
            imgView.image = imgOn
            self.isOn = true
        }else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
} // 수정페이지로 갈때는 사용하지 않고 메인화면으로 돌아왔을때 사용된다.
