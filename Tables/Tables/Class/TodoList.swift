//
//  TodoList.swift
//  Tables
//
//  Created by tj on 2022/09/17.
//

import Foundation
// Touch 기능이 필요없기 때문에 swift파일로 생성한다.

struct TodoList{ // 파일 이름하고 맞춰주는게 좋다
    //---
    var items : String
    var itemsImageFile : String
    //--- Field 또는 Property
    
    //--- 생성자
    init(items:String , itemsImageFile : String) { // 위에 선언한 변수와 이름 맞춰주는게 좋다
        self.items = items
        self.itemsImageFile = itemsImageFile
    }
    //--- 생성자를 안써주면 매번 위의 self.변수이름을 써줘야 한다
    
    
}
