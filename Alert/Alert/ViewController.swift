//
//  ViewController.swift
//  Alert
//
//  Created by TJ on 2022/08/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgLamp: UIImageView!
    var lampOn : UIImage?
    var lampOff : UIImage?
    var lampRemove : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampOn = UIImage(named: "lamp_on")!
        lampOff = UIImage(named: "lamp_off")!
        lampRemove = UIImage(named: "lamp_remove")!
        
        imgLamp.image = lampOn
    }

    @IBAction func btnOn(_ sender: UIButton) {
        if imgLamp.image == lampOn {
            let onAlert = UIAlertController(title: "경고", message: "현재 On 상태 입니다.", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "네, 알겠습니다", style: .default, handler: nil)
            onAlert.addAction(actionOK)
            present(onAlert, animated: true, completion: nil)
        }else{
            imgLamp.image = lampOn
        }
    }//
    
    @IBAction func btnOff(_ sender: UIButton) {
        if imgLamp.image == lampOff || imgLamp.image == lampRemove{
            let offAlert = UIAlertController(title: "경고", message: "현재 Off / Remove 상태 입니다." , preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "네, 알겠습니다", style: .default, handler: nil)
            offAlert.addAction(actionOK)
            present(offAlert, animated: true, completion: nil)
        }else{
            let offAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?" , preferredStyle: .alert)
            let actionOnOK = UIAlertAction(title: "네", style: .default, handler: {
                ACTION in
                self.imgLamp.image = self.lampOff
            })
            let actionNO = UIAlertAction(title: "아니요", style: .default, handler: nil)
            offAlert.addAction(actionOnOK)
            offAlert.addAction(actionNO)
            present(offAlert, animated: true, completion: nil)
        }
    }//
    
    @IBAction func btnRemove(_ sender: UIButton) {
        let removeAlert = UIAlertController(title: "램프 제거?", message: "램프를 제거 하시겠습니까?", preferredStyle: .alert)
        let actionOn = UIAlertAction(title: "아니요, 켭니다", style: .default, handler:{
            ACTION in
            self.imgLamp.image = self.lampOn
        })
        let actionOff = UIAlertAction(title: "아니요, 끕니다", style: .default, handler:{
            ACTION in
            self.imgLamp.image = self.imgLamp.image == self.lampRemove ? self.lampRemove : self.lampOff
        })
        let actionRemove = UIAlertAction(title: "네, 제거합니다", style: .default, handler: {
            ACTION in
            self.imgLamp.image = self.lampRemove
        })
        removeAlert.addAction(actionOn)
        removeAlert.addAction(actionOff)
        removeAlert.addAction(actionRemove)
        present(removeAlert, animated: true, completion: nil)
    }//
    
}//

