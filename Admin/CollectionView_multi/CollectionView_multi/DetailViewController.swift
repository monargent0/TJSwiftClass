//
//  DetailViewController.swift
//  CollectionView_multi
//
//  Created by tj on 2022/09/18.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView! // 동물사진
    @IBOutlet weak var lblContents: UILabel! // 설명
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgView.image = UIImage(named: Message.imageFile)
        lblContents.text = "이 동물의 이름은 \(Message.name) 이며\n분류는 \(Message.kind)이며\n날 수 \(Message.fly ? "있습니다" : "없습니다")"
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
