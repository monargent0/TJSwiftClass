//
//  AddViewController.swift
//  SQLite
//
//  Created by TJ on 2022/09/25.
//

import UIKit
import SQLite3 // *****

class AddViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfTell: UITextField!
    
    var db: OpaquePointer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // SQLite 생성하기
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentsData.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("error opening database")
        }
        
    }
    
    @IBAction func btnInsert(_ sender: UIButton) {
        var stmt: OpaquePointer? // statement 글자 queryString과 연결(짝꿍)
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self) // 한글 체크 변형
        
        // 사용자 입력값 
        let name = tfName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let dept = tfDept.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = tfTell.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let queryString = "INSERT INTO students (sname, sdept, sphone) VALUES (?,?,?)"
        
        // 번역
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert : \(errmsg)")
            return
        }
        
        // ?에 데이터 입력
        sqlite3_bind_text(stmt, 1, name , -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(stmt, 2, dept , -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(stmt, 3, phone , -1, SQLITE_TRANSIENT)
        
        if sqlite3_step(stmt) != SQLITE_DONE{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting : \(errmsg)")
            return
        }
        
        // alert 표시
        let resultAlert = UIAlertController(title: "결과", message: "입력되었습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "네, 알겠습니다", style: .default , handler: {ACTION in
            self.navigationController?.popViewController(animated: true)
        })
        
        resultAlert.addAction(okAction)
        present(resultAlert, animated: true, completion: nil)
        
//        print("Students saved successfully")
        
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
