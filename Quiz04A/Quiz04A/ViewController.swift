//
//  ViewController.swift
//  Quiz04A
//
//  Created by tj on 2022/08/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tfScore: UITextField!
    @IBOutlet weak var lblSummary: UILabel!
    
    var page = ["국어 점수","영어 점수","수학 점수","요약"]// 화면 순서
    var count = 0 // 현재 화면
    var scoreList : [Int] = []
    var tot : Int = 0
    var avg : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblTitle.text = page[count]
        lblSummary.text?.removeAll()
    }

    @IBAction func btnCalc(_ sender: UIButton) {
        // 인덱스 증가
        count += 1
        
        // 입력하지 않으면 0 입력
        let score = tfScore.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true ? 0 : Int(tfScore.text!)!
        
        // 입력한 값 리스트에 저장, 요약 출력
        switch count {
        case 1 : // 국어 계산, 영어 준비
            scoreList.append(score)
        case 2 : // 영어 계산, 수학 준비
            scoreList.append(score)
        case 3 : // 수학 계산과 요약 출력
            scoreList.append(score)
            // 점수 입력창 숨김
            tfScore.isHidden = true
            // 요약 출력 함수
            summary()
            // 점수 리스트 초기화
            scoreList.removeAll()
        default :
            // 인덱스 초기화
            count = 0
            // 입력창 숨김 해제
            tfScore.isHidden = false
            // 요약창 초기화
            lblSummary.text?.removeAll()
        }
        
        // 점수 입력창 초기화
        tfScore.text?.removeAll()
        // 입력받을 과목 표시
        lblTitle.text = page[count]
        
    }
   // 요약 출력 함수
    func summary () {
        for i in scoreList{
            tot += i
        }
        avg = Double(tot / scoreList.count)
        lblSummary.text = "총점은 \(tot)입니다.\n평균은 \(avg)입니다.\n국어 점수는 \(scoreList[0])점으로 \(avgUpDown(avg, scoreList[0]))\n영어 점수는 \(scoreList[1])점으로 \(avgUpDown(avg, scoreList[1]))\n수학 점수는 \(scoreList[2])점으로 \(avgUpDown(avg, scoreList[2]))"
    }
    // 평균 비교 출력
    func avgUpDown(_ avg : Double ,_ score : Int)-> String{
        if avg > Double(score){
            return "평균보다 낮습니다."
        }else if avg == Double(score){
            return "평균과 같습니다."
        }else {
            return "평균보다 높습니다."
        }
    }
}//

