//
//  JSONModel.swift
//  ServerJson_01
//
//  Created by tj on 2022/09/18.
//
// 용도
// Json을 가져올 모델

struct StudentJSON: Codable{ // JSON을 DBModel로 바꿔주는 역할
    var code : String
    var phone: String
    var name: String
    var dept : String
}
