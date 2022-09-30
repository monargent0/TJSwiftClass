//
//  SiteRequest.swift
//  Quiz14-01_A
//
//  Created by tj on 2022/09/04.
//

//import Foundation // console에 쓸때 사용
import WebKit

struct SiteRequest{
    func loadWebPage(url : String)-> URLRequest{
        let myUrl = URL(string: url)
        return URLRequest(url: myUrl!)
    }
}
