//
//  Students.swift
//  SQLite
//
//  Created by TJ on 2022/09/25.
//

import Foundation

class Students{
    var id: Int
    var name: String?
    var dept: String?
    var tel: String?
    
    // 보통 key값만 not null이기 때문에 다른 변수들을 optional 해준다
    
    init(id: Int, name: String?, dept:String?, tel:String?) {
        self.id = id
        self.name = name
        self.dept = dept
        self.tel = tel
    }
}
