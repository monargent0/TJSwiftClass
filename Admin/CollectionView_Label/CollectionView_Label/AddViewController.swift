//
//  AddViewController.swift
//  CollectionView_Label
//
//  Created by tj on 2022/09/18.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var tfHuman: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnInsert(_ sender: UIButton) {
        if tfHuman.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            Message.check = "Old"
        }else{
            Message.check = "New"
            Message.name = tfHuman.text!
        }
        
        tfHuman.text?.removeAll()
        navigationController?.popViewController(animated: true)
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
