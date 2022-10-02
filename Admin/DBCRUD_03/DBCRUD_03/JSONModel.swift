//
//  JSONModel.swift
//  DBCRUD_03
//
//  Created by TJ on 2022/10/02.
//
// jsp의 json과 key값 동일해야한다.
struct StudentJSON: Codable{ // JSON을 DBModel로 바꿔주는 역할
    var scode : String
    var sname: String
    var sdept : String
    var sphone: String
}
