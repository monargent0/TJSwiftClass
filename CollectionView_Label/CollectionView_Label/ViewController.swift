//
//  ViewController.swift
//  CollectionView_Label
//
//  Created by tj on 2022/09/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataInit()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func dataInit(){
        dataArray.append("유비")
        dataArray.append("관우")
        dataArray.append("장비")
        dataArray.append("조조")
        dataArray.append("여포")
        dataArray.append("동탁")
        dataArray.append("손견")
        dataArray.append("초선")
        dataArray.append("장양")
        dataArray.append("손책")
    }

}// VC
// extension
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    // Cell의 갯수
    func collectionView(_ collectionView : UICollectionView, numberOfItemsInSection section : Int) -> Int {
        return dataArray.count
    }
    // Cell의 구성
    func collectionView(_ collectionView : UICollectionView, cellForItemAt indexPath : IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath)
        cell.backgroundColor = .lightGray
        cell.lblHuman.text = dataArray[indexPath.row]
        cell.lblHuman.backgroundColor = .yellow
        
        return cell
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout{
    // 위 아래 간격
    // minimumLine
    // return 1
    
    // 좌우 간격
    //minimumInterit
    // return 1
    
    // cell size
    // sizeforitemat
    // let width = collectionView.frame.width / 3 - 1
    // let size = CGSize(width : width , height : width)
    //return size
}

