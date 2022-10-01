//
//  DetailViewController.swift
//  SQLite
//
//  Created by TJ on 2022/09/25.
//

import UIKit
import SQLite3 // *****

class DetailViewController: UIViewController {

    @IBOutlet weak var tfId: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfTell: UITextField!
    
    var db: OpaquePointer?
    
    var receivedID = 0
    var receivedName = ""
    var receivedDept = ""
    var receivedTel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tfId.text = String(receivedID)
        tfName.text = receivedName
        tfDept.text = receivedDept
        tfTell.text = receivedTel
        
        // SQLite 생성하기
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentsData.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("error opening database")
        }
        
    }
    
    @IBAction func btnUpdate(_ sender: UIButton) {
        var stmt: OpaquePointer? // statement 글자 queryString과 연결(짝꿍)
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self) // 한글 체크 변형, 아시아권 언어 모두 사용,
        // mac에서 개발할때는 utf-8로 설정되어있다. 안드로이드 윈도우 환경에서 번갈아 개발하면 한글코드가 달라 한글이 깨질 수 있다.
        
        // 기존 데이터
        let id = Int32(receivedID)
        let name = tfName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let dept = tfDept.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = tfTell.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let queryString = "UPDATE students SET sname = ?, sdept = ?, sphone = ? WHERE sid = ?"
        
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
        sqlite3_bind_int(stmt, 4, id)
        
        if sqlite3_step(stmt) != SQLITE_DONE{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting : \(errmsg)")
            return
        }
        
        // alert 표시
        let resultAlert = UIAlertController(title: "결과", message: "수정되었습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "네, 알겠습니다", style: .default , handler: nil)
        
        resultAlert.addAction(okAction)
        present(resultAlert, animated: true, completion: nil)
//        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func btnDelete(_ sender: UIButton) {
        // alert 표시
        let resultAlert = UIAlertController(title: "삭제", message: "정말 삭제하시겠습니까?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "네, 삭제합니다", style: .destructive , handler: {ACTION in
            var stmt: OpaquePointer? // statement 글자 queryString과 연결(짝꿍)
            
            let queryString = "DELETE FROM students WHERE sid = ?"
            // key
            let id = Int32(self.receivedID)
            
            // 번역
            if sqlite3_prepare(self.db, queryString, -1, &stmt, nil) != SQLITE_OK{
                // 여기서 -1은 쿼리문의 용량 제한이 없다는 뜻이다
                let errmsg = String(cString: sqlite3_errmsg(self.db)!)
                print("error preparing delete : \(errmsg)")
                return
            }
            // 첫번째에 데이터 입력 (sname)
            sqlite3_bind_int(stmt, 1, Int32(id))
            
            if sqlite3_step(stmt) != SQLITE_DONE{
                let errmsg = String(cString: sqlite3_errmsg(self.db)!)
                print("failure deleting : \(errmsg)")
                return
            }
            
            self.navigationController?.popViewController(animated: true)
        })
        let noAction = UIAlertAction(title: "아니요", style: .default, handler: nil)
        resultAlert.addAction(okAction)
        resultAlert.addAction(noAction)
        present(resultAlert, animated: true, completion: nil)
        
//        navigationController?.popViewController(animated: true)
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
