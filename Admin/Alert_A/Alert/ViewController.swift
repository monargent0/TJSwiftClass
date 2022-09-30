//
//  ViewController.swift
//  Alert
//
//  Created by tj on 2022/09/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var lampState = "on"
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgRemove = UIImage(named: "lamp_remove.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imgOn
    }

    @IBAction func btnOn(_ sender: UIButton) {
        if lampState == "on" {
            let errorAlert = UIAlertController(title: "경고", message: "현재 On 상태 입니다.", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
            errorAlert.addAction(actionOk)
            present(errorAlert , animated: true, completion: nil)
        }else {
            let onAlert = UIAlertController(title: "램프 켜기", message: "램프를 켜시겠습니까?", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "네, 켭니다.", style: .default, handler: {ACTION in
                self.imageView.image = self.imgOn
                self.lampState = "on"
            })
            let actionNo = UIAlertAction(title: "아니요, 켜지 않습니다.", style: .default, handler: nil)
            onAlert.addAction(actionOk)
            onAlert.addAction(actionNo)
            present(onAlert , animated: true, completion: nil)
        }
    }
    
    @IBAction func btnOff(_ sender: UIButton) {
        if lampState == "on" {
            let offAlert = UIAlertController(title: "램프끄기", message: "램프를 끄시겠습니까?", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "네", style: .default, handler: {ACTION in
                self.imageView.image = self.imgOff
                self.lampState = "off"
            })
            let actionNo = UIAlertAction(title: "아니요", style: .default, handler: nil)
            offAlert.addAction(actionOk)
            offAlert.addAction(actionNo)
            present(offAlert , animated: true, completion: nil)
        }else {
            let errorAlert = UIAlertController(title: "경고", message: "램프가 꺼져있거나 없습니다.", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler:nil)
            errorAlert.addAction(actionOk)
            present(errorAlert , animated: true, completion: nil)
        }
    }
    
    @IBAction func btnRemove(_ sender: UIButton) {
        if lampState == "remove" {
            let errorAlert = UIAlertController(title: "경고", message: "램프가 이미 Remove 상태입니다.", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
            errorAlert.addAction(actionOk)
            present(errorAlert , animated: true, completion: nil)
        }else {
            let removeAlert = UIAlertController(title: "램프 제거?", message: "램프를 제거하시곘습니까?", preferredStyle: .alert)
            let actionOff = UIAlertAction(title: "아니요, 끕니다!", style: .default, handler:{ACTION in
                self.imageView.image = self.imgOff
                self.lampState = "off"
            })
            let actionOn = UIAlertAction(title: "아니요, 켭니다!", style: .default, handler:{ACTION in
                self.imageView.image = self.imgOn
                self.lampState = "on"
            })
            let actionOk = UIAlertAction(title: "네, 재거합니다!", style: .default, handler:{ACTION in
                self.imageView.image = self.imgRemove
                self.lampState = "remove"
            })
            removeAlert.addAction(actionOff)
            removeAlert.addAction(actionOn)
            removeAlert.addAction(actionOk)
            present(removeAlert , animated: true, completion: nil)
        }
    }
    
}

