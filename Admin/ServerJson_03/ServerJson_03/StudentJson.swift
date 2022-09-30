//
//  StudentJson.swift
//  ServerJson_03
//
//  Created by TJ on 2022/09/24.
//

import Foundation


struct StudentJSON: Codable{ // Codable : JSON을 변환
    // codable을 사용할때 주의할점!  변수 이름을 JSON의 key값과 똑같이 만들어야 한다
    var code : String
    var phone: String
    var name: String
    var dept : String
}
