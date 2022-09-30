//
//  AddViewController.swift
//  Tables
//
//  Created by tj on 2022/09/17.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var tfAddItem: UITextField!
    @IBOutlet weak var pickerImg: UIPickerView!
    @IBOutlet weak var imgPreview: UIImageView!
    
    var imgList = ["pencil.png" , "clock.png", "cart.png"]
    var imageArray = [UIImage?]()
    var fileName = ""
    
    // picker view 설정 부분 (대문자 추천)
    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_COLUMN = 1 // numberOfComponents
    let PICKER_VIEW_HEIGHT : CGFloat = 40
    // 이렇게 선언하는 부분은 위에 적어주는것이 후에 수정하기에도 용이하다.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Image를 배열에 넣기
        for i in 0 ..< MAX_ARRAY_NUM{
            let image = UIImage(named: imgList[i])
            imageArray.append(image)
        }
        // 첫 화면 띄우기
        imgPreview.image = imageArray[0]
        fileName = imgList[0] // 피커뷰로 선택하지 않아도 첫화면 사진 이름 넘기기
        
        // picker 확장
        pickerImg.dataSource = self // extension으로 추가 되어있다
        pickerImg.delegate = self // extension
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        if tfAddItem.text!.isEmpty{
            Message.check = "Old"
        }else{
            Message.check = "New"
            Message.item = tfAddItem.text!
            Message.itemsImageFile = fileName
        }
        
        tfAddItem.text = ""
        navigationController?.popViewController(animated: true)
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}//avc
//외형
extension AddViewController : UIPickerViewDataSource{
    // col 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    // row 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return MAX_ARRAY_NUM
    }
}
//내형
extension AddViewController : UIPickerViewDelegate{
    
    // PickerView에 thumbnail 주기 (파일이름넣기와 동시에 불가능) : viewforrow
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: PICKER_VIEW_HEIGHT, height: PICKER_VIEW_HEIGHT)
        return imageView
    }
    
    // row 선택 했을 때
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imgPreview.image = imageArray[row] // 사진 보여주기
        fileName = imgList[row] // Add 버튼에서 Message에 넘길 파일 이름 저장하기
    }
    
    // 화면 크기
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
}
