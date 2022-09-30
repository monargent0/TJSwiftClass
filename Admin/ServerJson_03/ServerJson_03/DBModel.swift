//
//  DBModel.swift
//  ServerJson_03
//
//  Created by TJ on 2022/09/24.
//

import Foundation


class DBModel: NSObject{ // NSObject는 제일 상위 type
    // 내가 사용하는 부분이라 변수 이름은 마음대로 만들어도 된다
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
