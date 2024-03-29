//
//  TableViewController.swift
//  ServerJson_01
//
//  Created by tj on 2022/09/18.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var listTableView: UITableView!
    
    var feedItem : [DBModel] = [] // 데이터 받을 배열
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 시작
        let queryModel = QueryModel() // 쿼리모델 사용하려면 인스턴스 선언이 필요하다. 파일 QueryModel.swift
        queryModel.delegate = self
        queryModel.downloadItems() 
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 여기서 셀 디자인 작업한다
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = "성명 : \(feedItem[indexPath.row].sname)"
        content.secondaryText = "학번 : \(feedItem[indexPath.row].scode)"
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

}

// 내가 만든걸로 Extension하기
// async로 신호 받음
extension TableViewController: QueryModelProtoocol{ // QueryModel파일 상단
    func itemDownloaded(items: [DBModel]){
        feedItem = items
        self.listTableView.reloadData()
        // 작업은 비동기로 데이터를 가져오는 것과 그림을 그리는것을 동시에 하고, 보여줄때는 데이터를 다 가져온 후 reload로 보여준다
        // (데이터 불러오는게 먼저 끝날지, 화면 그리는게 먼저 끝날지 모르기 때문에 extension으로 순서를 맞춰 준 것이다)
    }
}
