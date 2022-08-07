//
//  main.swift
//  Day08
//
//  Created by TJ on 2022/08/07.
//

import Foundation
// Swift에만 있다
// Extension
// : 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있는 기능입니다.
//    ㄴ(대문자로 시작하는 것들)

// * extension은 viewController 밖에 써야한다

// Int 타입에 extension 기능 추가하기
extension Int {
    var isEven : Bool {
        return self % 2 == 0 // self : Int
    } // 짝수이면 true 홀수면 false가 나옴
    var isOdd : Bool{
        return self % 2 == 1
    }
}

print(1.isEven) // false
print(1.isOdd) // true

var number : Int = 3
print(number.isEven)

// 앱에서 extension을 viewController에 적용하려면 Delegate (대리자) 를 사용해야한다.
// class 이름 , 이름,이름{} 이런식의 코드는 옛날 방식이다. 최근 추세는 extension을 사용하는것.
// 엔터만 써도 구동되는 것은 extension과 delegate를 사용한것이다. TextField에 extension을 추가한것.

// Closure
// : 이름이 없는 함수
// ios에서 몇군데 closure로 꼭 써야하는 부분이 있다. (ex 메세지창)

// 함수
func sumFunction(a:Int, b:Int)-> Int{
    return a+b
}

var sumResult : Int = sumFunction(a: 10, b: 20)
print(sumResult)

// Closure
// (swift에서는 좀 복잡, ios에서는 정리가 되어있어서 조금 간편하게 쓸수있다.)
var sumClosure : (Int , Int) -> Int = {(a:Int , b:Int) -> Int in // * in 뒤에 코딩
    return a + b
}

sumResult = sumClosure(10, 20)
print(sumResult)
