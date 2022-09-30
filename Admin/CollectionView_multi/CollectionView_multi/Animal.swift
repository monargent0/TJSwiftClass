//
//  Animal.swift
//  CollectionView_multi
//
//  Created by tj on 2022/09/18.
//

import Foundation

struct Animal{
    var name: String
    var imageFile : String
    var fly : Bool
    var kind : String
    
    init(name : String , imageFile : String, fly : Bool, kind : String) {
        self.name = name
        self.imageFile = imageFile
        self.fly = fly
        self.kind = kind
    }
}
