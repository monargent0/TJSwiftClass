//
//  QueryModel.swift
//  DBCRUD_03
//
//  Created by TJ on 2022/10/02.
//
// 불러오는것만 json을 사용하기 때문에 query만 생성한다
import Foundation

protocol QueryModelProtocol: AnyObject{
    func itemDownloaded(items: [DBModel])
}

class QueryModel{
    
    var delegate: QueryModelProtocol!
    let urlPath = "http://localhost:8080/ios/student_query_ios.jsp"
    
    func downloadItems(){
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: .default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Faild to download data")
            }else{
                print("Data is downloaded")
                self.parseJSON(data!)
            }
        }//
        task.resume()
        
    }// downloadItems
    
    func parseJSON(_ data: Data){
        let decoder = JSONDecoder()
        var locations: [DBModel] = []
        do{
            let students = try decoder.decode( [StudentJSON].self, from: data)
            for student in students{
                let query = DBModel(code: student.scode, name: student.sname, dept: student.sdept, phone: student.sphone)
                locations.append(query)
            }
        }catch let error{
            print("Fail : \(error.localizedDescription)")
        }
        
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
        })
            
    }// parseJSON
}
