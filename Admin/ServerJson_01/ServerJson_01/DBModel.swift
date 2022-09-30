//
//  DBModel.swift
//  ServerJson_01
//
//  Created by tj on 2022/09/18.
//
// 용도
// 데이터 타입 선언

import Foundation// NSObject사용하기위해 import

class DBModel: NSObject{ // NSObject 는 제일 상위 type
    // property
    var scode: String
    var sname: String
    var sdept: String
    var sphone: String
    
    // constructor
    init(scode:String, sname:String, sdept:String, sphone:String) {
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
    }
}
