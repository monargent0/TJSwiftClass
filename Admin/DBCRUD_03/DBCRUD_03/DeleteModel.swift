//
//  DeleteModel.swift
//  DBCRUD_03
//
//  Created by TJ on 2022/10/02.
//

import Foundation

class DeleteModel{
    var urlPath = "http://localhost:8080/ios/student_delete_ios.jsp"
    
    func deleteItems(code:String)-> Bool{
        var result: Bool = true
        let urlAdd = "?code=\(code)"
        urlPath = urlPath + urlAdd
        
        // 한글 url encoding
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: .default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Faild to download data")
                result = false
            }else{
                print("Data is downloaded")
                result = true
            }
        }//
        task.resume()
        return result
    }// deleteItems
    
}
