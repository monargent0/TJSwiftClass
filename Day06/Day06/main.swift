//
//  main.swift
//  Day06
//
//  Created by TJ on 2022/07/31.
//

import Foundation

/*
// 사용자로 부터 더하기 할 숫자들의 갯수를 정한 후에 숫자를 입력 받아서 합계를 구하자!
var sumNum = 0

print("몇 개의 숫자를 더할까요? ", terminator: "")
// default로 한 줄 띄어쓰기(\n)로 되어있으므로 이를 막음
var inpNum = Int(readLine()!) // 사용자가 입력받는 것도 null safety

if let repNum: Int = inpNum{ //Int 값 외에 나머지는 else로
    print("\(repNum)개의 숫자를 입력하세요")
    for _ in 1...repNum{
        let innerCount = Int(readLine()!)
        sumNum += innerCount !
    }
    print("입력한 숫자의 합은 \(sumNum)입니다.")
}else{
    print("Input value is wrong!")
}
*/

// 터미네이터를 바꿔 쓸 수 있다
print("aaa" , terminator: "\t\t") // 터미네이터의 기본값 terminator: "\n"
print("bbb")

// Exercise
/* 입력한 자릿수 정수의 합을 구하는 프로그램
 Enter an integer (0-9) : 12345678
 Sum of digits = 36
 */

/*
var sumInt = 0
print("Enter an integer(0-9) : " , terminator: "")
//var inputNum = Int(readLine()!) // 사용자가 입력

if var splitNum: Int = Int(readLine()!) { //Int 값 외에 나머지는 else로
    while splitNum > 0 {
        sumInt += splitNum % 10
        splitNum = splitNum / 10
    }
    print("입력한 숫자의 합은 \(sumInt)입니다.")
}else{
    print("Input value is wrong!")
}
*/

/* // 강사님 풀이
var remainder = 0 // 나머지값
var sumNo = 0 // 누적 합계
print("Enter an integer(0-9) : " , terminator: "")
var inpNum = Int(readLine()!)
if var repNum : Int = inpNum{ // repNum : 몫
   while repNum != 0{
       remainder = repNum % 10
        sumNo += remainder
        repNum /= 10
   }
    print("Sum of digits = \(sumNo)")
}else{
    print("Input value is wrong!")
}
*/

//--------------
// 함수 (Function)
//--------------

func integerSum(a: Int , b:Int) -> Int{
    return a + b
}
func integerSum2(num1: Int , num2:Int) -> String{
    return "\(num1) + \(num2) = \(num1 + num2)"
}
func integerSum3(_ num1: Int , _ num2:Int) -> String{ // _ num1 --> _ : 사용할때 보이는 , num1 : 내부에서 사용하는 변수
    return "\(num1) + \(num2) = \(num1 + num2)"
}
func integerSum3P(정수1 num1: Int , 정수2 num2:Int) -> String{
    return "\(num1) + \(num2) = \(num1 + num2)"
}
print(integerSum(a: 5, b: 8))
print(integerSum2(num1: 5, num2: 8))
print(integerSum3(5,8))
print(integerSum3P(정수1: 5, 정수2: 8))

func sayHelloWorld() {
    print("Hello World!")
}
//sayHelloWorld()

// Ex
// sayHelloWorld2 라는 함수를 만든다
// 사용법 sayHelloWorld2(3) <- "Hello World!"를 3번 출력한다.
func sayHelloWorld2(_ rep : Int) {
    for _ in 1...rep{
        print("Hello World!")
    }
}
sayHelloWorld2(3)

// 매개변수의 기본값
func greeting(friend:String , me:String = "조조"){ // 예전 버전에는 --> Void 를 써줘야 했다
    print("Hello \(friend)! I'm \(me)")
}

greeting(friend: "유비", me: "조조")
greeting(friend: "장비", me: "조조")

greeting(friend: "유비") // 기본값 있는것과 사용자가 입력하는것 두 함수 다 사용할 수 있다.
greeting(friend: "관우", me: "동탁")

func greeting2(friend:String = "유비" , me:String = "조조"){
    print("Hello \(friend)! I'm \(me)")
}
greeting2()

// 가변 매개변수
func sayHelloToFriends(me:String, friends: String... ) -> String{
    return "Hello \(friends) I'm \(me)"
}

print(sayHelloToFriends(me: "초선", friends: "손견","손책","장양"))
print(sayHelloToFriends(me: "초선")) // friends에 비어있는 배열 출력됨

// 복수의 값을 반환하는 함수
// Tuple을 함수의 반환 값으로 사용할 수 있습니다. 자바에선 안됨 파이썬부터 튜플 등장
func getCountry() -> (dialCode : Int , isoCode : String , name : String){
    let country = (dialCode : 82, isoCode : "KR" , name : "Korea")
    return country
}
let ret = getCountry()
print(ret.dialCode)

// Overloading : 함수의 이름은 중복되도 parameter의 갯수로 구분이 가능
// 도형의 면적, 둘레를 구하는 함수를 구현하세요
// 원
func shape(_ r : Double){
    let pi = 3.14
    let area = pi * r * r
    let border = 2 * pi * r
    print("원 : \(area) , \(border)")
}
// 사각형
func shape(_ w : Int , _ h : Int){
    let area = w * h
    let border = 2 * (w + h)
    print("직사각형 : \(area) , \(border)")
}
// 삼각형
func shape(_ w : Int , _ h : Int , _ l : Int){
    let area = w * h / 2
    let border = w + h + l
    print("직각삼각형 : \(area) , \(border)")
}
// 원의 면적과 둘레를 구하자!
shape(6)
// 직사각형의 면적과 둘레를 구하자
shape(5,6)
// 직각삼각형의 면적과 둘레를 구하자
shape(3, 4, 5)


