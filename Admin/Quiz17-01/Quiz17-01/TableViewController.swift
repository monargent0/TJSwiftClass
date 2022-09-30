//
//  TableViewController.swift
//  Quiz17-01
//
//  Created by tj on 2022/09/17.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var tvMainView: UITableView!
    
    var dataArray :  [Animal] = []
    
    // 셀 높이 지정
    let CELL_HEIGHT : CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataInit()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func dataInit(){
        dataArray.append(Animal(animal: "벌", kind: "곤충", fly: true, animalImgFile: "bee.png"))
        dataArray.append(Animal(animal: "고양이", kind: "포유류", fly: false, animalImgFile: "cat.png"))
        dataArray.append(Animal(animal: "젖소", kind: "포유류", fly: false, animalImgFile: "cow.png"))
        dataArray.append(Animal(animal: "강아지", kind: "포유류", fly: false, animalImgFile: "dog.png"))
        dataArray.append(Animal(animal: "여우", kind: "포유류", fly: false, animalImgFile: "fox.png"))
        dataArray.append(Animal(animal: "원숭이", kind: "영장류", fly: false, animalImgFile: "monkey.png"))
        dataArray.append(Animal(animal: "돼지", kind: "포유류", fly: false, animalImgFile: "pig.png"))
        dataArray.append(Animal(animal: "늑대", kind: "포유류", fly: false, animalImgFile: "wolf.png"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvMainView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = dataArray[indexPath.row].animal
        cell.imageView?.image = UIImage(named: dataArray[indexPath.row].animalImgFile)
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
            dataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
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
    
    // 셀 높이 지정
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CELL_HEIGHT * CGFloat(indexPath.row + 1)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail"{
            // cell 정보 가져오기
            let cell = sender as! UITableViewCell // sender가 정보를 가지고 있다
            let indexPath = tvMainView.indexPath(for: cell) // 위와 달리 indexPath가 없기 때문에 테이블뷰에서 가져와서 만들어준다
            Message.animal = dataArray[indexPath!.row].animal
            Message.kind = dataArray[indexPath!.row].kind
            Message.fly = dataArray[indexPath!.row].fly
            Message.animalImgFile = dataArray[indexPath!.row].animalImgFile
        }
    }
    

}
