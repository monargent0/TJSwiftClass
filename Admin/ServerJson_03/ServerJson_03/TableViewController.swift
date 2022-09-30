//
//  TableViewController.swift
//  ServerJson_03
//
//  Created by TJ on 2022/09/24.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var listTableView: UITableView!
    
    var feedItem : [DBModel] = []
    var imgFile = ["clock.png", "cart.png" , "pencil.png"]
    
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

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.imgView.image = UIImage(named: imgFile[indexPath.row % 3])
        cell.lblName.text = "성명 : \(feedItem[indexPath.row].sname)"
        cell.lblPhone.text = "전화 : \(feedItem[indexPath.row].sphone)"
        
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
extension TableViewController : QueryModelProtoocol{
    func itemDownloaded(items: [DBModel]) {
        feedItem = items // 배열 데이터
        self.listTableView.reloadData() // 화면 재구성
    }
}
