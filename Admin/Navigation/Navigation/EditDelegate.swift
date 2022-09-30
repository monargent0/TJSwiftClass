//
//  EditDelegate.swift
//  Navigation
//
//  Created by tj on 2022/09/04.
//

import Foundation

// 프로토콜 : 작업 지시서 (자바의 인터페이스)
protocol EditDelegate{
    func didMessageEditDone(_ controller : EditViewController, message : String)
    func didImageOnOffDone(_ controller : EditViewController, isOn : Bool)
}
// editViewController에서도 동일한 이름으로 사용해야한다.
