//
//  ViewController.swift
//  Quiz07
//
//  Created by TJ on 2022/08/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lbCurrentTime: UILabel! // 현재 시간
    @IBOutlet weak var lbPickTime: UILabel! // 선택 시간
    
    let intv = 1.0
    let timeSelector : Selector = #selector(ViewController.updateTime)
    
    var alramTime:String!
    var count = 0 // 빨간색, 파란색
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: intv , target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm" // 24시간으로 표현 : HH
        lbPickTime.text = "선택시간 \(formatter.string(from: datePickerView.date))"
        
        formatter.dateFormat = "a hh:mm"
        alramTime = formatter.string(from: datePickerView.date)
    }
    
    // updateTime
    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko") // 시간
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" // EEE : 요일 , a : AM/PM
        lbCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))"
        
        formatter.dateFormat = "a hh:mm"
        let currentTime = formatter.string(from: date as Date)
        count += 1
        if currentTime == alramTime {
            view.backgroundColor = count % 2 == 0 ? UIColor.red :  UIColor.blue
        } else {
            view.backgroundColor = UIColor.white
        }
    }// updateTime
}// viewController

