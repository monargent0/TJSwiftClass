//
//  EditViewController.swift
//  Quiz15_A
//
//  Created by tj on 2022/09/04.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var lblColor: UILabel!
    @IBOutlet weak var swLampOn: UISwitch!
    @IBOutlet weak var swColorOn: UISwitch!
    
    var lampIsOn = Message.lampIsOn //
    var colorIsOn = Message.colorIsOn //
    
    override func viewDidLoad() {
        super.viewDidLoad()

        swLampOn.isOn = lampIsOn
        swColorOn.isOn = colorIsOn
        lblOnOff.text = lampIsOn ? "On" : "Off"
        lblColor.text = colorIsOn ? "Yellow" : "Red"
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swLampAction(_ sender: UISwitch) {
        lblOnOff.text = sender.isOn ? "On" : "Off"
        Message.lampIsOn = sender.isOn ? true : false
    }
    
    @IBAction func swColorAction(_ sender: UISwitch) {
        lblColor.text = sender.isOn ? "Yellow" : "Red"
        Message.colorIsOn = sender.isOn ? true : false
    }
    

}
