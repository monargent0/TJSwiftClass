//
//  ViewController.swift
//  Quiz15_A
//
//  Created by tj on 2022/09/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgRed = UIImage(named: "lamp_red.png")
    
    var lampIsOn = true //
    var colorIsOn = true // yellow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.image = imgOn
    }
    
    override func viewWillAppear(_ animated: Bool) {
        switch Message.lampIsOn {
        case true:
            imgView.image = Message.colorIsOn == true ? imgOn : imgRed
        default :
            imgView.image = imgOff
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        Message.colorIsOn = colorIsOn
        Message.lampIsOn = lampIsOn
    }

}

