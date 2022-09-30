//
//  TodoList.swift
//  Table
//
//  Created by tj on 2022/09/04.
//

struct TodoList{
    var items: String
    var itemsImageFile: String
    
    init(items : String , itemsImageFile:String){
        self.items = items // self items는 위에 선언한 var , items는 init생성할때 입력하는 값
        self.itemsImageFile = itemsImageFile
    }
}
