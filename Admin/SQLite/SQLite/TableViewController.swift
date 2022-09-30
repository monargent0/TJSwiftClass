//
//  TableViewController.swift
//  SQLite
//
//  Created by TJ on 2022/09/25.
//

import UIKit
import SQLite3 // **** SQLite import 없으면 기능 사용 못함

class TableViewController: UITableViewController {
    
    var studentsList: [Students] = [] // 배열 초기값
    var db: OpaquePointer? // sqlite3_open에서 사용, sql파일에 어떤게 컬럼이고 데이터인지 알고있는 역할, 메모리 포인터, C언어
    // db : DB와 연결 / stmt : queryString 글자와 연결
    @IBOutlet var tvListView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // 화면 뜨기 전 sqlite 처리 해야한다
        // SQLite 생성하기
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentsData.sqlite") //  이 파일은 내 app 안에 있어야 한다
        // 내 app 안에 빈 파일을 만드는 작업
        // try -> 파일이 있으면 파일을 안만들고 없으면 StudentsData라는 빈 파일을 만든다
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("error opening database")
        }
        
        if sqlite3_exec(db,
                        "CREATE TABLE IF NOT EXISTS students (sid INTEGER PRIMARY KEY AUTOINCREMENT, sname TEXT, sdept TEXT, sphone TEXT)", nil, nil, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)) // error message
            print("error creating table \(errmsg)")
            return // 에러가 나면 여기서 끝내야 (아무의미없는) 뒤로 안 넘어간다
        }// Table이 없으면 새로 생성, varchar가 없으므로 TEXT로 사용
        
        // Temp Insert -- 기능 테스트 용
//        tempInsert() // insert func
        
//        readValues() // select func
        // -----------------
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    // 화면 다시 실행 (첫화면, Add,Detail 다녀온 후)
    override func viewWillAppear(_ animated: Bool) {
        readValues()
    }
    
// ------
    func tempInsert(){
        // errmsg는 실행이 잘 되는 것을 확인하면 없앤다.
        var stmt: OpaquePointer? // statement 글자 queryString과 연결(짝꿍)
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self) // 한글 체크 변형
        
        let queryString = "INSERT INTO students (sname, sdept, sphone) VALUES (?,?,?)"
        // 번역
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert : \(errmsg)")
            return
        }
        // 첫번째에 데이터 입력 (sname)
        sqlite3_bind_text(stmt, 1, "유비", -1, SQLITE_TRANSIENT) // SQLITE_TRANS를 해줘야 한글이 들어간다. 첫번째 ? 에 "유비"라는 데이터를 넣은 것
        sqlite3_bind_text(stmt, 2, "컴퓨터공학과", -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(stmt, 3, "1234", -1, SQLITE_TRANSIENT)
        
        if sqlite3_step(stmt) != SQLITE_DONE{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting : \(errmsg)")
            return
        }
        
        print("Students saved successfully")
        
    }
    
    func readValues(){
        studentsList.removeAll()
        let queryString = "SELECT * FROM students"
        var stmt: OpaquePointer?
        
        // 번역 sql - swift
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select : \(errmsg)")
            return
        }
        // 데이터가 있는만큼 넘어오게 될것 (갯수 모름)
        while(sqlite3_step(stmt) == SQLITE_ROW){ // 데이터 갯수 만큼 반복
            let id = sqlite3_column_int(stmt, 0) // select 되는 첫번째 데이터
            // sqlite는 c로 구성되어 있어 cstring 타입이다. swift string으로 변환이 필요하다.
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let dept = String(cString: sqlite3_column_text(stmt, 2))
            let phone = String(cString: sqlite3_column_text(stmt, 3))
            
            print(id, name, dept, phone)
            studentsList.append(Students(id: Int(id), name: name, dept: dept, tel: phone))
        }
        
        self.tvListView.reloadData()
    }
// -----
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentsList.count
    }

    // cell 구성
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = "학번 : \(studentsList[indexPath.row].id)"
        content.secondaryText = "성명 : \(studentsList[indexPath.row].name!)" // optional 설정을 해줬었기 때문에 ! 달아줘야 한다
        cell.contentConfiguration = content
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let id = studentsList[indexPath.row].id
            
            deleteAction(id)
            readValues()
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    // 삭제 func
    func deleteAction(_ id:Int){
        var stmt: OpaquePointer? // statement 글자 queryString과 연결(짝꿍)
        
        let queryString = "DELETE FROM students WHERE sid = ?"
        
        // 번역
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            // 여기서 -1은 쿼리문의 용량 제한이 없다는 뜻이다
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing delete : \(errmsg)")
            return
        }
        // 첫번째에 데이터 입력 (sname)
        sqlite3_bind_int(stmt, 1, Int32(id))
        
        if sqlite3_step(stmt) != SQLITE_DONE{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure deleting : \(errmsg)")
            return
        }
        
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            
            let detailView = segue.destination as! DetailViewController
            detailView.receivedID = studentsList[indexPath!.row].id
            detailView.receivedName = studentsList[indexPath!.row].name!
            detailView.receivedDept = studentsList[indexPath!.row].dept!
            detailView.receivedTel = studentsList[indexPath!.row].tel!
            
            
        }
    }
    

}

