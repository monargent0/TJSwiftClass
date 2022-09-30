//
//  ViewController.swift
//  AlertActionSheet
//
//  Created by TJ on 2022/08/07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAlert(_ sender: UIButton) {
        // UIAlertController 초기화
        let testAlert = UIAlertController(title: "TITLE", message: "Message", preferredStyle: .alert ) // preferredStyle에서 alert / actionsheet 선택
        // 버튼 생성
        // UIAlertAction 설정
        let actionDefault = UIAlertAction(title: "Action Default", style: .default , handler: nil) // handler가 closure
        let actionCancel = UIAlertAction(title: "Action Cancel", style: .cancel , handler: nil)
        // Closure를 이용한 실행
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive , handler:{
            ACTION in // in 뒤에 코딩
            print("Destructive action called")
        })
        
        // UIAlertController에 UIAlertAction 추가
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionCancel)
        testAlert.addAction(actionDestructive)
        // 출력
        present(testAlert, animated: true, completion: nil ) // completion 모양이 closure
    }//
    @IBAction func btnAction(_ sender: UIButton) {
        // UIAlertController 초기화
        let testAlert = UIAlertController(title: "TITLE", message: "Message", preferredStyle: .actionSheet ) // preferredStyle에서 alert / actionsheet 선택
        // 버튼 생성
        // UIAlertAction 설정
        let actionDefault = UIAlertAction(title: "Action Default", style: .default , handler: nil) // handler가 closure
        let actionCancel = UIAlertAction(title: "Action Cancel", style: .cancel , handler: nil)
        // Closure를 이용한 실행
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive , handler:{
            ACTION in // in 뒤에 코딩
            print("Destructive action called")
        })
        
        // UIAlertController에 UIAlertAction 추가
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionCancel)
        testAlert.addAction(actionDestructive)
        // 출력
        present(testAlert, animated: true, completion: nil ) // completion 모양이 closure
    }//
    
}// ViewController

