//
//  ViewController.swift
//  DatePicker
//
//  Created by TJ on 2022/08/06.
//

import UIKit

class ViewController: UIViewController { // multitasking (2가지 일 할거니까 CPU2개 사용) - CPU 1 : 현재시간 / CPU 2 : datePicker 선택시간
    // 시간은 ios가 준다. 시간을 받으려면 os와 같은 언어로 써야한다. ios는 ObjectC이다. ->  swift에서 ObjectC 사용

    @IBOutlet weak var lbCurrentTime: UILabel!
    @IBOutlet weak var lbPickerTime: UILabel!
    
    let interval = 1.0 // 1초 마다 update - 60초로 쓰면 1분마다 시간이 업데이트 될 것이다.
    let timeSelector : Selector = #selector(ViewController.updateTime) // ObjectC // updateTime은 내가 만들 func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        // Timer는 instance를 만들지 않음 static으로 직접 가져와야한다. instance쓰면 초기값 불러오니까 기원전시간,,? 00년..?
        // interval 얼마 동안에 한번 움직일거야 / self = viewcontroller / selector는 objectC에서 함수이다.
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" // 24시간으로 표현 : HH
        lbPickerTime.text = "선택시간 \(formatter.string(from: datePickerView.date))"
    }

    // Async Task 로 1초당 1번씩 구동
    // updateTime - ObjectC로 바뀌어 Compile된다. #selector가 쓸 수 있게하기 위함
    @objc func updateTime(){
        let date = NSDate() // Next Step
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko") // 시간
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" // EEE : 요일 , a : AM/PM
        lbCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))"
    }
    

} // ViewController

