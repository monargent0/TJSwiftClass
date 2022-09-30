//
//  ViewController.swift
//  ButtonName3
//
//  Created by TJ on 2022/07/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbEmoji: UILabel! // ! : nil ~~ null
    // ! 이 없으면 null값을 수용 안하는 변수라는 뜻
    // character메모리 , string메모리 중복 으로 차지하게 됨
    let heart:String = "😍"
    let merong:String = "😝"
    let angry:String = "😡"

    var ftSize : CGFloat = 25.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        lbEmoji.text?.removeAll()
        lbEmoji.text = heart
    }

    @IBAction func btnHeart(_ sender: UIButton) {
        lbEmoji.text?.append(heart)
    }
    
    @IBAction func btnMerong(_ sender: UIButton) {
        lbEmoji.text?.append(merong)
    }
    
    @IBAction func btnAngry(_ sender: UIButton) {
        lbEmoji.text?.append(angry)
    }
    
    @IBAction func btnDel(_ sender: UIButton) {
        if(lbEmoji.text?.isEmpty == false ){
//            lbEmoji.text?.remove(at: lbEmoji.text!.index(before: lbEmoji.text!.endIndex))
            lbEmoji.text?.removeLast()
            
        }else{        }
    } // btnDel
  
    @IBAction func btnInc(_ sender: UIButton) {
        ftSize += 10
        lbEmoji.font = UIFont.systemFont(ofSize: ftSize)
    }
    @IBAction func btnDec(_ sender: UIButton) {
        ftSize -= 5
        lbEmoji.font = UIFont.systemFont(ofSize: ftSize)
    }
} // ViewController

