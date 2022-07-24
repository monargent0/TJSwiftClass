//
//  ViewController.swift
//  EmojiTest
//
//  Created by TJ on 2022/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbNumber: UILabel!
    var arrNumber = ["10", "20", "25", "35", "40", "45", "50", "60", "70" ,"80"]
    var indexState = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbNumber.text = arrNumber[0]
    }

    @IBAction func btnIncrease(_ sender: UIButton) {
//        print(arrNumber.count) // 10
        // 강사님 풀이
        indexState += 1
        if indexState >= arrNumber.count{
            lbNumber.text = "X"
        }else{
            lbNumber.text = arrNumber[indexState]
        }
        
        //-------------끝나면 처음으로 가서 반복
//        if indexState < arrNumber.count-1 {
//            indexState += 1
//            lbNumber.text = arrNumber[indexState]
//        }else{ // indexState >= arrNumber.count
//            lbNumber.text = arrNumber[0]
//            indexState = 0
//        }
        
    }
    
}

