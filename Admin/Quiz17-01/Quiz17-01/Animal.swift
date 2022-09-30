//
//  Animal.swift
//  Quiz17-01
//
//  Created by tj on 2022/09/17.
//

import Foundation

struct Animal{
    // property
    var animal : String
    var kind : String
    var fly : Bool
    var animalImgFile : String
    //---
    
    // constructor
    init(animal: String, kind : String, fly : Bool , animalImgFile : String) {
        self.animal = animal
        self.kind = kind
        self.fly = fly
        self.animalImgFile = animalImgFile
    }
    //---
}
