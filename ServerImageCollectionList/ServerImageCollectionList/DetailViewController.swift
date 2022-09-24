//
//  DetailViewController.swift
//  ServerImageCollectionList
//
//  Created by TJ on 2022/09/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = Message.movieTitle
        imgLoad(Message.imgUrl)
        // Do any additional setup after loading the view.
    }
    
    func imgLoad(_ imgUrl: String){
        let url = URL(string: imgUrl)
        let defaultSession = Foundation.URLSession(configuration: .default)
        
        let task = defaultSession.dataTask(with: url!){(data,response, error) in
            if error != nil{
                print("Failed to download data")
            }else{
                DispatchQueue.main.async {
                    self.imgView.image = UIImage(data: data!)
                    
                }
            }
        }
        task.resume()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
