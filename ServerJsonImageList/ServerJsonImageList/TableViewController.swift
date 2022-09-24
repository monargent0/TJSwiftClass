//
//  TableViewController.swift
//  ServerJsonImageList
//
//  Created by TJ on 2022/09/24.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var movieTableView: UITableView!
    
    var feedItem : [DBModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let queryModel = QueryModel() // instance 생성
        queryModel.delegate = self
        queryModel.downloadItems()
        // ----------
        
        // 셀 높이
        movieTableView.rowHeight = 150
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
        // 제일 최신버전 서버 이미지 출력 방법
//        let url = URL(string: feedItem[indexPath.row].imgUrl)
//        let defaultSession = Foundation.URLSession(configuration: .default)
//
//        let task = defaultSession.dataTask(with: url!){(data,response, error) in
//            if error != nil{
//                print("Failed to download data")
//            }else{
////                print("Data is downloaded")
//                DispatchQueue.main.async {
//                    cell.imgView.image = UIImage(data: data!)
//                }
//            }
//
//        }
//        task.resume()
        
        imgLoad(cell , feedItem[indexPath.row].imgUrl) // 이미지 출력 코드 func으로 뺴기
        cell.lblMovie.text = "\(feedItem[indexPath.row].movieTitle)"
        
        return cell
    }
    
    func imgLoad(_ cell : TableViewCell , _ imgUrl : String){
        let url = URL(string: imgUrl)
        let defaultSession = Foundation.URLSession(configuration: .default)
        
        let task = defaultSession.dataTask(with: url!){(data,response, error) in
            if error != nil{
                print("Failed to download data")
            }else{
//                print("Data is downloaded")
                DispatchQueue.main.async {
                    cell.imgView.image = UIImage(data: data!)
                    
                }
            }
                
        }
        task.resume()
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

}//TVC
extension TableViewController: QueryModelProtoocol{
    func itemDownloaded(items: [DBModel]) {
        feedItem = items
        
        self.movieTableView.reloadData()
    }
}
