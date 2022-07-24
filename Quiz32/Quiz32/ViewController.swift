//
//  ViewController.swift
//  Quiz32
//
//  Created by TJ on 2022/07/23.
//

import UIKit

class ViewController: UIViewController {
    // 입력
    @IBOutlet weak var tfStartNum: UITextField!
    @IBOutlet weak var tfEndNum: UITextField!
    // 결과
    @IBOutlet weak var lbResult: UILabel!
    // 전역변수 선언
    var num1st : Int = 0
    var num2nd : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        tfStartNum.text = nil
//        tfEndNum.text = nil
        // swift5부터 ios에서는 nil값을 안넣어도 된다.
        lbResult.text?.removeAll()
    }

    @IBAction func btnSum(_ sender: UIButton) {
//        // 입력을 안하였을 경우 기본값 0으로 대체하여 계산하기
//        let startNum = Int(tfStartNum.text!) ?? 0
//        let endNum = Int(tfEndNum.text!) ?? 0
//        // 입력 확인
////        print(startNum)
////        print(type(of: startNum))
//
//        // 순서변경, 범위 합 계산 출력 함수
//        sumfunc(start: startNum , end: endNum)
        
        // -----------------강사님
        // 순서 정렬
        orderNum()
        // 계산 출력
        lbResult.text = "숫자의 합계는 \(addCalc())입니다."
    }
    

    // 순서 변경 , 계산
    func sumfunc(start : Int , end : Int){
        
        let startNew : Int
        let endNew : Int
        // 시작 숫자가 끝 숫자보다 작으면 순서 바꾸기
        if start > end {
          startNew = end
          endNew = start
        }else{
            startNew = start
            endNew = end
        }
        // 범위 계산 함수
        scopeAdd(start: startNew, end: endNew)
    } //sumfunc
    
    // 범위 합 계산 함수
    func scopeAdd(start : Int , end : Int){
        var sum = 0
        for i in start...end{
            sum += i
        }
        lbResult.text = "숫자의 합 계산 결과는 \(sum) 입니다."
    } //scopeAdd
    
    // 강사님 방식----------
    func orderNum(){
        // 입력을 안하였을 경우 기본값 0으로 대체하여 계산하기
        let startNum = Int(tfStartNum.text!) ?? 0
        let endNum = Int(tfEndNum.text!) ?? 0
        // 시작 숫자가 끝 숫자보다 작으면 순서 바꾸기
        if startNum > endNum {
          num1st = endNum
          num2nd = startNum
        }else{
            num1st = startNum
            num2nd = endNum
        }
    } //orderNum
    // 범위 합 계산 함수
    func addCalc()->Int{
        var sum = 0
        for i in num1st...num2nd{
            sum += i
        }
        return sum
    } //addCalc
    
}//ViewController

