//
//  TableViewController.swift
//  ServerJson_02
//
//  Created by TJ on 2022/09/24.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var listTableView: UITableView!
    
    var feedItem : [DBModel] = [] // 데이터 초기값 배열 선언
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // -----------
        // 쿼리모델 파일 안에 제이슨 파일, 디비모델 파일 다 들어가 있기때문에 쿼리모델하나만 실행시켜주면 된다
        let queryModel = QueryModel() // instance 생성
        queryModel.delegate = self
        queryModel.downloadItems()
        // ----------
        // 셀 높이 
        listTableView.rowHeight = 124
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedItem.count
    }

    // cell 디자인
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell // 내가 만든 tableviewcell로 변환 시켜줘야 한다.
        // as 변환이 없으면 애플이 만든 기본 셀 포맷을 사용한다라는 뜻이다.

        // Configure the cell...
        // tableviewcell에 선언한 구성
        cell.lblCode.text = "학변:\(feedItem[indexPath.row].scode)"
        cell.lblName.text = "성명:\(feedItem[indexPath.row].sname)"
        cell.lblDept.text = "전공:\(feedItem[indexPath.row].sdept)"
        cell.lblPhone.text = "전화:\(feedItem[indexPath.row].sphone)"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}// TVC

extension TableViewController: QueryModelProtoocol{ // 프로토콜 연결 익스텐션이 필요하다
    // 쿼리모델프로토콜에서 정의한 함수만 선언하면 된다
    func itemDownloaded(items: [DBModel]) {
        feedItem = items // 배열 데이터
        self.listTableView.reloadData() // 화면 재구성
    }
}
