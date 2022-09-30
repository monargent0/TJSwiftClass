//
//  ViewController.swift
//  PickerViewA
//
//  Created by tj on 2022/08/28.
//

import UIKit // 또는 SwiftUI가 있다.
// UIkit을 이용해서 개발했다.

class ViewController: UIViewController {
    
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var pickerImg: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageName = ["w1.jpg","w2.jpg","w3.jpg","w4.jpg","w5.jpg","w6.jpg","w7.jpg","w8.jpg","w9.jpg","w10.jpg"]
    var imageArray = [UIImage?]()
    
    // 이미지를 빠르게 띄우기 위하여 이미지 자체도 배열에 넣고 시작하기 (로딩시간이 조금 길어져도 소비자는 기다리지만 중간중간이 길어지는건 안기다린다)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Image를 배열에 넣기
        for i in 0..<10{
            let image = UIImage(named: imageName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = imageName[0]
        imageView.image = imageArray[0]
        
        pickerImg.dataSource = self // extension으로 추가 되어있다
        pickerImg.delegate = self // extension
    }//


}//viewcontroller
//extension작성

// 외형
extension ViewController: UIPickerViewDataSource{
    // pickerView의 컬럼 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // pickerView의 Row 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageName.count
    }
    
}
// 내형
extension ViewController : UIPickerViewDelegate{
//    // PickerView에 파일 이름 넣기 : title 만 타이핑하고 titleForRow 있는 선택지 선택
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageName[row]
//    }
    
    // PickerView에 thumbnail 주기 (파일이름넣기와 동시에 불가능) : viewforrow
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 60, height: 40)
        return imageView
    }
    
    
    // PickerView Row 선택 : didselectrow or row 타이핑
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageName[row]
        imageView.image = imageArray[row]
    }
    
}

// 유저아이디비밀번호 외에 가능하면 사용자입력을 받지 않는것이 좋다.
