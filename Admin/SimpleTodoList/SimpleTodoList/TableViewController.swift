//
//  TableViewController.swift
//  SimpleTodoList
//
//  Created by tj on 2022/09/17.
//

import UIKit
import SQLite3 // *****

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    // DB 데이터포인터 선언
    var db: OpaquePointer?
    
    // Todo 내용
    typealias Todo = (id : Int , content : String )
    var todoData : [Todo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        createTable()
        // 초기 test
//        tempInsert()
//        readValues()
    }
    
    // 화면 다시 실행
    override func viewWillAppear(_ animated: Bool) {
        readValues()
    }
    
    //-
    func createTable(){
        // SQLite 생성하기
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("SimpleTodoData.sqlite")
        // .appending(path:"SimpleTodoData.sqlite") // 새로 업데이트 appendingPathComponent 삭제될 예정이라 바꿔야함
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("error opening database")
        }
        
        if sqlite3_exec(db,
                        "CREATE TABLE IF NOT EXISTS todo (sid INTEGER PRIMARY KEY AUTOINCREMENT, scontent TEXT)", nil, nil, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)) // error message
            print("error creating table \(errmsg)")
            return
        }// Table이 없으면 새로 생성
        
    }//
    
    func tempInsert(){
        // errmsg는 실행이 잘 되는 것을 확인하면 없앤다.
        var stmt: OpaquePointer? // statement 글자 queryString과 연결(짝꿍)
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self) // 한글 체크 변형
        
        let queryString = "INSERT INTO todo (scontent) VALUES (?)"
        // 번역
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert : \(errmsg)")
            return
        }
        // 데이터 입력
        sqlite3_bind_text(stmt, 1, "간단한 메모를 기록해 봅시다.", -1, SQLITE_TRANSIENT)
        
        if sqlite3_step(stmt) != SQLITE_DONE{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting : \(errmsg)")
            return
        }
        
        print("Students saved successfully")
        
    } //
    
    func readValues(){
        todoData.removeAll() // 화면 내용 초기화
        let queryString = "SELECT * FROM todo"
        var stmt: OpaquePointer?
        
        // prepare : 번역 sql 언어를 -> swift가 알 수 있게
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select : \(errmsg)")
            return
        }
        // 데이터가 있는만큼 넘어오게 될것 (갯수 모름)
        while(sqlite3_step(stmt) == SQLITE_ROW){ // 데이터 갯수 만큼 반복
            let id = sqlite3_column_int(stmt, 0) // select 되는 첫번째 데이터
            // sqlite는 c로 구성되어 있어 cstring 타입이다. swift string으로 변환이 필요하다.
            let content = String(cString: sqlite3_column_text(stmt, 1))
            
            print(id, content)
            todoData.append( Todo(id: Int(id) , content: content) )
        }
        
        self.tvListView.reloadData()
    }//-
    
    
    // 추가 버튼
    @IBAction func btnAdd(_ sender: UIBarButtonItem) {
        let addAlert = UIAlertController(title: "Todo List", message: "추가할 내용을 입력하세요!", preferredStyle: .alert)
        // textFeild
        addAlert.addTextField{ ACTION in //  closure
            ACTION.placeholder = "추가 내용"
        }

        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        let okAction = UIAlertAction(title: "추가", style: .default, handler: {ACTION in
            if addAlert.textFields![0].text?.isEmpty == true {
                return
            }
            self.insertAction(addAlert.textFields![0].text!)
            self.readValues()
        })
        
        addAlert.addAction(cancelAction)
        addAlert.addAction(okAction)
        present(addAlert, animated: true , completion: nil)
    }
    
    func insertAction(_ tfContent: String){
        var stmt: OpaquePointer? // statement 글자 queryString과 연결(짝꿍)
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self) // 한글
        
        // 사용자 입력값
        let content = tfContent.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let queryString = "INSERT INTO todo (scontent) VALUES (?)"
        
        // 번역
        if sqlite3_prepare(self.db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(self.db)!)
            print("error preparing insert : \(errmsg)")
            return
        }
        
        // ?에 데이터 입력
        sqlite3_bind_text(stmt, 1, content , -1, SQLITE_TRANSIENT)
        
        
        if sqlite3_step(stmt) != SQLITE_DONE{
            let errmsg = String(cString: sqlite3_errmsg(self.db)!)
            print("failure inserting : \(errmsg)")
            return
        }
        
    }
    
    // MARK: - Table view data source
    // 섹션
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    // 열 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
//        cell.textLabel?.text = dataArray[indexPath.row] // 삭제될 예정
        
        var content = cell.defaultContentConfiguration()
        content.text = todoData[indexPath.row].content
        // 위처럼 text만 여기까지 작성하면 이제는 이미지가 안보인다
        content.image = UIImage(systemName: "pencil.tip.crop.circle")
        // 시스템 이미지 추가
        
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

    // 셀 삭제
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let id = todoData[indexPath.row].id
            
            deleteAction(id)
            readValues()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // 삭제 func
    func deleteAction(_ id:Int){
        var stmt: OpaquePointer? // statement 글자 queryString과 연결(짝꿍)
        
        let queryString = "DELETE FROM todo WHERE sid = ?"
        
        // 번역
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            // 여기서 -1은 쿼리문의 용량 제한이 없다는 뜻이다
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing delete : \(errmsg)")
            return
        }
        // 첫번째에 데이터 입력 (sname)
        sqlite3_bind_int(stmt, 1, Int32(id)) // sqlite는 c언어 기반이라 int가 32bit가 최대이다
        
        if sqlite3_step(stmt) != SQLITE_DONE{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure deleting : \(errmsg)")
            return
        }
        
    }//
    
    // 목록 이동
    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
