//
//  DBModel.swift
//  ServerImageCollectionList
//
//  Created by TJ on 2022/09/24.
//

import Foundation

class DBModel: NSObject{ // NSObject는 제일 상위 type
    // 내가 사용하는 부분이라 변수 이름은 마음대로 만들어도 된다
    // property
    var imgUrl: String
    var movieTitle: String

    
    // constructor
    init(imgUrl:String, movieTitle:String) {
        self.imgUrl = imgUrl
        self.movieTitle = movieTitle

    }
}
