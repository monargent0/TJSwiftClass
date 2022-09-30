//
//  DetailViewController.swift
//  Tables
//
//  Created by tj on 2022/09/17.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblItem.text = Message.item
        imgView.image = UIImage(named: Message.itemsImageFile)
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
