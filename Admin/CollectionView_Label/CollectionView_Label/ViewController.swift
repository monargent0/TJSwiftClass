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
        
        dataInit() // 데이터
        
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

    // Detail View에 Data 넘기기
    // segue사용은 prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail"{
            // cell을 알아야 정보를 가져옴
            let cell = sender as! CollectionViewCell // sender가 아는 정보를 cell 정보로 변환
            let indexPath = collectionView.indexPath(for: cell)
            Message.name = dataArray[indexPath!.row]
        }
    }
    
    // 화면 넘어왔을떄
    override func viewWillAppear(_ animated: Bool) {
        // data추가하고 화면 재구성
        // data 추가 함수
        appendData()
        // 화면 재구성
        collectionView.reloadData() // table과 모양만 다르고 구성이 같다
    }
    
    func appendData(){
        if Message.check == "New"{
            dataArray.append(Message.name)
            Message.check = "Old"
        }
    }
}// VC
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell // deque - async비동기, as!로 type변경
        cell.backgroundColor = .lightGray
        cell.lblHuman.text = dataArray[indexPath.row]
        cell.lblHuman.backgroundColor = .yellow

        return cell
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
        let width = collectionView.frame.width / 3 - 1
        let size = CGSize(width: width, height: width)
        return size
    }
}

