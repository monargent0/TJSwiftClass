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
    
    // 화면이 졸고있다가 앞으로 튀어나왔을때 활성화되는 함수 :  viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        tfMessage.text = Message.message

        if Message.isOn {
            imgView.image = imgOn
        }else{
            imgView.image = imgOff
        }
        
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
        
        Message.message = tfMessage.text!
    }
    
    

}// VC


