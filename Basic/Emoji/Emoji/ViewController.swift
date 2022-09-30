//
//  ViewController.swift
//  Emoji
//
//  Created by TJ on 2022/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbList: UILabel!
    @IBOutlet weak var lbEmoji: UILabel!
    var emojiList = ["😄","🥰","😎","🥳","🙄","🥴","🥺","🤓","😘"]
    var indexState = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbEmoji.text = emojiList[0]
        for emoji in emojiList{
            lbList.text?.append(emoji)
        }
    }

    @IBAction func btnPlay(_ sender: UIButton) {
        indexState += 1
        if indexState >= emojiList.count {
            indexState = 0
        }
        
        lbEmoji.text = emojiList[indexState]
    }
    
    @IBAction func btnPrev(_ sender: UIButton) {
        indexState -= 1
        if indexState < 0{
            indexState = emojiList.count - 1
        }
        
        lbEmoji.text = emojiList[indexState]
    }
}

