//
//  ViewController.swift
//  Quiz17-01
//
//  Created by tj on 2022/09/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblContent: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: Message.animalImgFile)
        lblContent.text = "이 동물의 이름은 \(Message.animal) 이며 \n분류는 \(Message.kind)이며 \n날 수 \(Message.fly ? "있습니다" : "없습니다")"
        
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
