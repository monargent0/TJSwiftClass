//
//  DetailViewController.swift
//  CollectionView_Label
//
//  Created by tj on 2022/09/18.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        lblName.text = Message.name
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