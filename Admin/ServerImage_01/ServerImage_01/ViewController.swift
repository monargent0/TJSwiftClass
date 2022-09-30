//
//  ViewController.swift
//  ServerImage_01
//
//  Created by TJ on 2022/09/24.
//

import UIKit

class ViewController: UIViewController {
    // https://zeushahn.github.io/Test/images/~
    // 이미지 불러오는 코드가 매우 길 경우 옛날버전 코드다
    @IBOutlet weak var imgDisplay: UIImageView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLoadImage1(_ sender: UIButton) {
//        let url = URL(string: "https://zeushahn.github.io/Test/images/dog.jpg")
//        let data = try? Data(contentsOf: url!) // data를 가져왔으므로 이미지 파일이다
//        imgDisplay.image = UIImage(data: data!)
        
        // 제일 최신 버전
        let url = URL(string: "https://zeushahn.github.io/Test/images/dog.jpg")
        let defaultSession = Foundation.URLSession(configuration: .default)
        
        let task = defaultSession.dataTask(with: url!){(data,response, error) in
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloaded")
                DispatchQueue.main.async {
                    self.imgDisplay.image = UIImage(data: data!)
                }
            }
                
        }
        task.resume()
    }
    

    @IBAction func btnLoadImage2(_ sender: UIButton) {
        downLoadItems()
    }

    func downLoadItems(){
        let url = URL(string: "https://zeushahn.github.io/Test/images/dog2.jpg")
        let defaultSession = Foundation.URLSession(configuration: .default)
        
        let task = defaultSession.dataTask(with: url!){(data,response, error) in
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloaded")
                DispatchQueue.main.async {
                    self.imgDisplay.image = UIImage(data: data!)
                }
            }
        }
        task.resume()
    }
    
}

