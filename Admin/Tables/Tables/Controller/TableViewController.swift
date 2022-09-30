//
//  TableViewController.swift
//  Tables
//
//  Created by tj on 2022/09/17.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    // 화면에 몇개 들어올지 모르기 때문에 배열 (컬렉션)을 사용한다
    var dataArray :  [TodoList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataInit() // Function
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Long Press
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)) )
        tvListView.addGestureRecognizer(longPress) // TableView에 제스쳐 기능 추가
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        // Edit 버튼을 만들고 삭제 기능을 추가하기, 왼쪽으로 배치하기
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    func dataInit(){
        dataArray.append(TodoList(items: "책 구매", itemsImageFile: "cart.png"))
        dataArray.append(TodoList(items: "철수와 약속", itemsImageFile: "clock.png"))
        dataArray.append(TodoList(items: "스터디 준비하기", itemsImageFile: "pencil.png"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        appendData()
        tvListView.reloadData() // 화면 재구성 잊지말기
    }
    
    func appendData(){
        if Message.check == "New"{
            dataArray.append(TodoList(items: Message.item, itemsImageFile: Message.itemsImageFile))
            Message.check = "Old"
        }
    }
    
    // Long Press Action
    @objc func handleLongPress(sender: UILongPressGestureRecognizer){ // sender는 LongPress를 아는 역할
        if sender.state == .began{ // LongPress가 시작 되면
            let touchPoint = sender.location(in: tableView)
            if tvListView.indexPathForRow(at: touchPoint) != nil{
                let touchNumber = tvListView.indexPathForRow(at: touchPoint)![1] // [section, row]
                print("Long Pressd" , touchNumber)
                alertDialog(touchNumber) // 알림창 함수
            }
        }
    }
    // 알림창 띄우기
    func alertDialog(_ touchNumber : Int){
        let addAlert = UIAlertController(title: "Todo List", message: "수정할 내용을 입력하세요!", preferredStyle: .alert)
        // textFeild
        addAlert.addTextField{ addText in // 변수명을 addText로 사용하는 closure
            addText.text = self.dataArray[touchNumber].items
            //print(addAlert.textFields!)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "수정", style: .default, handler: {ACTION in
            self.dataArray[touchNumber].items = addAlert.textFields![0].text!
            self.tvListView.reloadData()
        })
        
        addAlert.addAction(cancelAction)
        addAlert.addAction(okAction)
        present(addAlert, animated: true , completion: nil)
    }
    
    // MARK: - Table view data source

    // 보통은 섹션이 1개
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // 섹션당 열의 갯수 정의
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    // 셀의 구성 정의
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
//        cell.textLabel?.text = dataArray[indexPath.row].items // 삭제될 예정
//        cell.imageView?.image = UIImage(named: dataArray[indexPath.row].itemsImageFile )
        // cell 하나에 두 개의 구성이 들어가 있다.
        
        var content = cell.defaultContentConfiguration()
        content.text = dataArray[indexPath.row].items
        content.image = UIImage(named: dataArray[indexPath.row].itemsImageFile )
        cell.contentConfiguration = content
        // 애플이 제공하는 cell 디자인을 사용할때는
        // 위 처럼 cell에 하나하나 구성해주는것이 아니라, content로 하나 거쳐서 cell에는 한번에 알려 주도록 바뀌었다. 22/09
        // ios CPU가 바뀔 예정이라 그런듯
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Table 셀 삭제
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            dataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // 삭제시 버튼 이름 Delete -> '삭제' 로 변경
    // titlefordelete
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }

    // 목록 순서 바꾸기 (햄버거 버튼 생김)
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = dataArray[fromIndexPath.row]
        dataArray.remove(at: fromIndexPath.row)
        dataArray.insert(itemToMove, at: to.row)
    }
    

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
            // cell 정보 가져오기
            let cell = sender as! UITableViewCell // sender가 정보를 가지고 있다
            let indexPath = tvListView.indexPath(for: cell) // 위와 달리 indexPath가 없기 때문에 테이블뷰에서 가져와서 만들어준다
            Message.item = dataArray[indexPath!.row].items
            Message.itemsImageFile = dataArray[indexPath!.row].itemsImageFile
        }
    }//
    

}
