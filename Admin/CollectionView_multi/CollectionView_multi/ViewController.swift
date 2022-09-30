//
//  ViewController.swift
//  CollectionView_multi
//
//  Created by tj on 2022/09/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionViewAnimal: UICollectionView!
    
    var dataArray : [Animal] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataInit()
        
        collectionViewAnimal.delegate = self
        collectionViewAnimal.dataSource = self
    }
    
    func dataInit(){
        dataArray.append(Animal(name: "벌", imageFile: "bee.png", fly: true, kind: "곤충"))
        dataArray.append(Animal(name: "고양이", imageFile: "cat.png", fly: false, kind: "포유류"))
        dataArray.append(Animal(name: "소", imageFile: "cow.png", fly: false, kind: "포유류"))
        dataArray.append(Animal(name: "개", imageFile: "dog.png", fly: false, kind: "포유류"))
        dataArray.append(Animal(name: "여우", imageFile: "fox.png", fly: false, kind: "포유류"))
        dataArray.append(Animal(name: "원숭이", imageFile: "monkey.png", fly: false, kind: "영장류"))
        dataArray.append(Animal(name: "돼지", imageFile: "pig.png", fly: false, kind: "포유류"))
        dataArray.append(Animal(name: "늑대", imageFile: "wolf.png", fly: false, kind: "포유류"))
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail"{
            // cell을 알아야 정보를 가져옴
            let cell = sender as! CollectionViewCell // sender가 아는 정보를 cell 정보로 변환
            let indexPath = collectionViewAnimal.indexPath(for: cell)
            Message.name = dataArray[indexPath!.row].name
            Message.imageFile = dataArray[indexPath!.row].imageFile
            Message.kind = dataArray[indexPath!.row].kind
            Message.fly = dataArray[indexPath!.row].fly
        }
    }
}// vc

// extension
extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    
    // Cell의 갯수
    //numberofitemsinsection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    // Cell의 구성
    // cellforitem
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell   // deque - async비동기, as!로 type변경
//        cell.backgroundColor = .lightGray
        cell.imgView.image = UIImage(named: dataArray[indexPath.row].imageFile)
        cell.lblName.text = dataArray[indexPath.row].name
        return cell

    }
    

}// cell , table은 reuseable하다 갯수가 아무리 추가되어도 1개의 메모리만 차지한다. 그래서 cell을 많이 사용함

extension ViewController: UICollectionViewDelegateFlowLayout{ // delegateflowlayout을 쓰기위해서는 위에서 delegate가 미리 있어야 한다
    // 위 아래 간격
    // linespacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1 // 1px
    }
    
    // 좌우 간격
    // Interitemspacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // cell 크기
    // sizeforitemat
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / 2 - 1
//        let height = collectionView.frame.height
        let size = CGSize(width: width, height: width)
        return size
        
    }
}
// ---- collectionView

