//
//  ViewController.swift
//  PickerView
//
//  Created by TJ on 2022/08/07.
//

import UIKit

class ViewController: UIViewController {
    var imageFileName = ["w1.jpg","w2.jpg","w3.jpg","w4.jpg","w5.jpg","w6.jpg","w7.jpg","w8.jpg","w9.jpg","w10.jpg"]
    @IBOutlet weak var pickerImage: UIPickerView!//
    @IBOutlet weak var lbImageFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    let picker_View_Column = 1 // PickerView의 컬럼 갯수
    var imageArray = [UIImage?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 그림 파일을 배열에 넣고 빠르게 뜨게 한다. 밑에서 배열로 부르면 된다.
        for i in 0..<imageFileName.count{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        lbImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
        
        pickerImage.dataSource = self // 피커뷰 외형틀
        pickerImage.delegate = self // 피커뷰 내부
    } // viewDid
/*
 picker view - 외형 shape / 데이터 data 로 구성되어있음
 pickerview는 action이 없다.
 pickerview action은 extension이 한다.
 피커뷰 쓰려면 extension을 꼭 알아야 한다. */

} // viewController
// pickerView Shape 외형
extension ViewController : UIPickerViewDataSource{
    // picker view의 컬럼 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return picker_View_Column
    }
    // picker view의 row 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
} // pickerviewshape

// pickerView Action 내부 기능
extension ViewController: UIPickerViewDelegate{
    // Picker view에 파일명 배치하기 (titleForRow)
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    // 파일명 대신 thumbnail 섬네일 보여주기 (viewForRow)
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 30) // 0,0은 왼쪽 제일 상단
        return imageView
    }
    
    // Picker view로 선택된 파일명을 레이블 및 image view 에 출력 (didSelectRow)
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lbImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
} // pickerviewaction
