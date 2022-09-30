//
//  ViewController.swift
//  Quiz06
//
//  Created by TJ on 2022/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var imageName = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png"]
    var numImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        disPlayImg()
    }

    @IBAction func btnPrev(_ sender: UIButton) {
        numImage -= 1
        if numImage < 0{
            numImage = imageName.count-1
        }
        disPlayImg()
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        numImage += 1
        if numImage >= imageName.count{
            numImage = 0
        }
        disPlayImg()
    }
    
    func disPlayImg(){
        imgTitle.text = imageName[numImage]
        imgView.image = UIImage(named: imageName[numImage])
    }
} //ViewController

