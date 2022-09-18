//
//  ViewController.swift
//  CollectionView_Image
//
//  Created by tj on 2022/09/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionViewDown: UICollectionView!
    
    var dataArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataInit()
        
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionViewDown.delegate = self
        collectionViewDown.dataSource = self
    }
    
    func dataInit(){
        dataArray.append("flower_01.png")
        dataArray.append("flower_02.png")
        dataArray.append("flower_03.png")
        dataArray.append("flower_04.png")
        dataArray.append("flower_05.png")
        dataArray.append("flower_06.png")
        dataArray.append("flower_01.png")
        dataArray.append("flower_02.png")
        dataArray.append("flower_03.png")
        dataArray.append("flower_04.png")
        dataArray.append("flower_05.png")
        dataArray.append("flower_06.png")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail"{
            // cell을 알아야 정보를 가져옴
            let cell = sender as! CollectionViewCell // sender가 아는 정보를 cell 정보로 변환
            let indexPath = collectionView.indexPath(for: cell)
            Message.imgFile = dataArray[indexPath!.row]
        }
    }
    
} // vc
// extension
extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    
    // Cell의 갯수
    //numberofitemsinsection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewDown{
            return 6
        }else{
            return dataArray.count
        }
        
    }
    // Cell의 구성
    // cellforitem
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 컬렉션 뷰 2개 설정
        if collectionView == collectionViewDown{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell2   // deque - async비동기, as!로 type변경
            cell.imgView.image = UIImage(named: dataArray[indexPath.row])
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell   // 구조가 똑같다면 같은 CollectionViewCell 파일에 cell 이름만 다르게 해서도 사용할 수 있을 것 같다
            cell.imgView.image = UIImage(named: dataArray[indexPath.row])
            return cell
        }
        
//        cell.imgView.image = UIImage(named: dataArray[indexPath.row])
//        return cell
    }
    
    // click event
    // 현재 어플은 이 기능이 필요하지는 않음, 셀을 클릭했을때 기능 추가 가능한 영역
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(dataArray[indexPath.row])
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
        // 컬렉션 뷰 2개 사이즈 다르게 설정
        if collectionView == collectionViewDown{
            let width = collectionView.frame.width
            let height = collectionView.frame.height
            let size = CGSize(width: width, height: height)
            return size
        }else{
            let width = collectionView.frame.width/3-1
            let height = collectionView.frame.height
            let size = CGSize(width: width, height: height)
            return size
        }
        
    }
}
// ---- collectionView


