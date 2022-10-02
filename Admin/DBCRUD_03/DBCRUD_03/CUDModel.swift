//
//  CUDModel.swift
//  DBCRUD_03
//
//  Created by TJ on 2022/10/02.
//

import Foundation

class CUDModel{
    // 모델 파일 하나만 만들어서 할 수 있는지 TEST 하기 위함
    // 가능하지만 퍼포먼스상 각각 모델이 따로 있는게 퍼포먼스가 좋다. 1바이트 사용하려고 100바이트 불르는 꼴임
    
    func insertItems(code:String, name:String, dept:String, phone:String)-> Bool{
        var urlPath = "http://localhost:8080/ios/student_insert_ios.jsp"
        
        var result: Bool = true
        let urlAdd = "?code=\(code)&name=\(name)&dept=\(dept)&phone=\(phone)"
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
    }// insertItems
    
    func updateItems(code:String, name:String, dept:String, phone:String)-> Bool{
        var urlPath = "http://localhost:8080/ios/student_update_ios.jsp"
        var result: Bool = true
        let urlAdd = "?code=\(code)&name=\(name)&dept=\(dept)&phone=\(phone)"
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
    }// updateItems
    
    
    
    func deleteItems(code:String)-> Bool{
        var urlPath = "http://localhost:8080/ios/student_delete_ios.jsp"
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
