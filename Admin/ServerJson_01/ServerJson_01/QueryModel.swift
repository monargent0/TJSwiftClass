//
//  QueryModel.swift
//  ServerJson_01
//
//  Created by tj on 2022/09/18.
//
// 용도
// 서버에 있는 내용을 들고와서 (네트워크 작업 필요) DB모델로 바꾼 후 Table에 내용이 넘어가야 한다.
// 프로토콜은 기능이 없고 신호만 주는것이다. 받는애가 받아서 함수를 작동하는 것

import Foundation

// 프로토콜
protocol QueryModelProtoocol: AnyObject{
    func itemDownloaded(items: [DBModel])
}
// 
class QueryModel{
    var delegate: QueryModelProtoocol! //프로토콜
    let urlPath = "https://zeushahn.github.io/Test/ios/student.json" // 소스 주소, jsp로 사용 가능
    
    func downloadItems(){ // TableViewController에서 얘를 실행하면 연결해서 가져옴
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in // dataTask : async
            if error != nil{
                print("Failed to download datat")
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
            let students = try decoder.decode( [StudentJSON].self , from: data)
            //jsonmodel에 있는 json모델이랑 모양이 똑같은지 확인
            // 반복문으로 데이터 저장
            for student in students{ // 이상이 없는 데이터만 for문에 들어간다
                let query = DBModel(scode: student.code, sname: student.name, sdept: student.dept, sphone: student.phone)
                locations.append(query) // 있는만큼 데이터 들어간다
            }
            print(students.count)
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
