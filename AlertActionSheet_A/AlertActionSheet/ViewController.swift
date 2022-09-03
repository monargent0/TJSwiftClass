//
//  ViewController.swift
//  AlertActionSheet
//
//  Created by tj on 2022/09/03.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAlert(_ sender: UIButton) {
        // UIAlertController 초기화
        let testAlert = UIAlertController(title: "Title제목", message: "Message메세지", preferredStyle: .alert) // alert 컨트롤러
        
        // UIAlertAction 설정
        let actionDefault = UIAlertAction(title: "Action Default", style: .default, handler: nil) // handler: nil = closure 눌렀을때 화면만 꺼지겠다
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive, handler: {ACTION in
            // 여기에 동작 기능 작성한다
            print("destructive action called")
        }) // 빨간 버튼
        let actionCancel = UIAlertAction(title: "Action Cancel", style: .cancel, handler: nil) // Bold체 버튼
        
        // Controller에 버튼 추가
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionDestructive)
        testAlert.addAction(actionCancel)
        
        present(testAlert, animated: true, completion: nil) // alert를 화면에 띄우는 역할 , closure
    }
    
    @IBAction func btnActionSheet(_ sender: UIButton) {
        // Alert와 ActionSheet 컨트롤러만 바꿔주면 된다. 기본 구조 동일
        // UIAlertController 초기화
        let testAlert = UIAlertController(title: "Title제목", message: "Message메세지", preferredStyle: .actionSheet)
        
        // UIAlertAction 설정
        let actionDefault = UIAlertAction(title: "Action Default", style: .default, handler: nil)
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive, handler: {ACTION in
            print("destructive action called")
        })
        let actionCancel = UIAlertAction(title: "Action Cancel", style: .cancel, handler: nil)
        
        // Controller에 버튼 추가
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionDestructive)
        testAlert.addAction(actionCancel)
        
        // alert를 화면에 띄우는 역할
        present(testAlert, animated: true, completion: nil)
    }
    
}// ViewController
// 모든 화면은 컨트롤러를 가지고 있다. Alert도 하나의 화면이다.
// closure : {ACTION in 여기에 동작 기능 작성}
