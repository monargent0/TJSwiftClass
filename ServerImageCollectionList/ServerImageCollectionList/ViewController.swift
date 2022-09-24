//
//  ViewController.swift
//  ServerImageCollectionList
//
//  Created by TJ on 2022/09/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
    
    var feedItem : [DBModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myIndicator.startAnimating()
        myIndicator.isHidden = false
        
        let queryModel = QueryModel() // instance 생성
        queryModel.delegate = self
        queryModel.downloadItems()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail"{
            // cell을 알아야 정보를 가져옴
            let cell = sender as! CollectionViewCell // sender가 아는 정보를 cell 정보로 변환
            let indexPath = collectionView.indexPath(for: cell)
            Message.imgUrl = feedItem[indexPath!.row].imgUrl
            Message.movieTitle = feedItem[indexPath!.row].movieTitle
        }
    }

} // VC

extension ViewController: QueryModelProtoocol{
    func itemDownloaded(items: [DBModel]) {
        feedItem = items
        self.collectionView.reloadData()
       
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    // cell 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedItem.count
    }
    // cell 구성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell
        imgLoad(cell, feedItem[indexPath.row].imgUrl)
        return cell
    }
    // 서버 이미지 출력 함수
    func imgLoad(_ cell: CollectionViewCell, _ imgUrl: String){
        let url = URL(string: imgUrl)
        let defaultSession = Foundation.URLSession(configuration: .default)
        
        let task = defaultSession.dataTask(with: url!){(data,response, error) in
            if error != nil{
                print("Failed to download data")
            }else{
                DispatchQueue.main.async {
                    cell.imgView.image = UIImage(data: data!)
                    self.myIndicator.stopAnimating()
                    self.myIndicator.isHidden = true
                    
                }
            }
        }
        task.resume()
    }
    
}

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
            let width = collectionView.frame.width / 3 - 1
//            let height = collectionView.frame.height
            let size = CGSize(width: width, height: width)
            return size
    }
}
