//
//  DBModel.swift
//  DBCRUD_03
//
//  Created by TJ on 2022/10/02.
//

// 데이터 타입 선언

import Foundation// NSObject사용하기위해 import

class DBModel: NSObject{ // NSObject 는 제일 상위 type
    // property
    var code: String
    var name: String
    var dept: String
    var phone: String
    
    // constructor
    init(code:String, name:String, dept:String, phone:String) {
        self.code = code
        self.name = name
        self.dept = dept
        self.phone = phone
    }
}
