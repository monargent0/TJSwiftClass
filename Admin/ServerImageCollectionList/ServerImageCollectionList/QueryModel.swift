//
//  QueryModel.swift
//  ServerImageCollectionList
//
//  Created by TJ on 2022/09/24.
//

import Foundation


protocol QueryModelProtoocol: AnyObject{
    func itemDownloaded(items: [DBModel])
}

class QueryModel{
    var delegate: QueryModelProtoocol! //프로토콜
    let urlPath = "https://zeushahn.github.io/Test/ios/movies.json" // 소스 주소, jsp로 사용 가능
    
    func downloadItems(){ // TableViewController에서 얘를 실행하면 연결해서 가져옴
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in // dataTask : async
            // data : 데이터 , respone : 400, 404 등등 , error : nil(정상처리)이 아니면 문제가 있다
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data Is a downloaded")
                print(data!)
                self.parseJSON(data!) // 파싱한다
            }
        }
        task.resume() // resume을 써줘야 위에서 선언한 task가 작동한다.
    }
    
    // json데이터를 DBModel 타입으로 바꿔준다
    func parseJSON(_ data: Data){
        // json모델을 db모양으로 바꾸는것 (jsonmodel에서 codable이 함)
        let decoder = JSONDecoder()  // 다운로드 된 data를 풀어줘야한다
        var locations: [DBModel] = []
        do{ // do catch로 에러 잡기 (어플 죽음 방지)
            let movies = try decoder.decode( [MovieJson].self , from: data)
            //jsonmodel에 있는 json모델이랑 모양이 똑같은지 확인
            // 반복문으로 데이터 저장
            for movie in movies{ // 이상이 없는 데이터만 for문에 들어간다
                let query = DBModel(imgUrl: movie.image , movieTitle: movie.title)
                locations.append(query) // 있는만큼 데이터 들어간다
            }
            print(movies.count)
        }catch let error{
            print("Fail : \(error.localizedDescription)") // localize 한국이면 한글로 영어권이면 영어로 나온다
        }
        
        // Async로 프로토콜이 동작하게 해줘야 한다
        DispatchQueue.main.async(execute: {()-> Void in
            // extension TableViewController: QueryModelProtoocol 부분 protocol신호가 나간다
            self.delegate.itemDownloaded(items: locations)
        } )
        
    }
}
