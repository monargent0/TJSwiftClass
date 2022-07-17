//
//  main.swift
//  Day02
//
//  Created by TJ on 2022/07/17.
//

import Foundation

// 문자열과 문자의 결합
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
print(welcome)

var instruction = "look over"
instruction += string2
print(instruction)

let exclamationMark1: Character = "!" // 굳이 character를 쓰는 이유 : 메모리를 줄일 수 있다.
// 용량이 너무 크면 앱스토어에서 거부 당할 수 있다.
welcome.append(exclamationMark1) // String = Character + Character + ... ['L','o','v','e'] 배열 형식
// append는 Character / String 구분 없이 가능
print(welcome)

// 문자열 길이
let str : String = "12345,6789"
print(str.count)

// 조건문 Condition
if str.count == 0 {
    print("Data가 없습니다.")
}else{
    print("Data는 \(str)입니다.")
}

// Any Type
// 파이썬 , R 모든 타입이 any 이다.
var someAny : Any = 100
print(someAny)
someAny = "어떤 타입도 수용 가능합니다."
print(someAny)
someAny = 123.12
print(someAny)

var someDouble : Double = 12.11
//print(someAny + someDouble) // Error : any는 any끼리만 가능하다
// Any를 Double로 변환
let someAny1 : Double = someAny as! Double // Double(someAny)는 불가능
print(someDouble + someAny1) // 000000002는 수치에 대한 오류라 해결 불가능 무시~

// nil : null , NULL , Null , NA, NaN
/*
 - nil은 없음을 의미하는 키워드
 */

// Tuple
// Tuple 사용 전 선언 및 출력방법
var dialCode = 82
var isoCode = "KR"
var name = "Korea"

print(dialCode , isoCode, name)

// Tuple의 사용
// 변수를 아껴 쓸수 있으니 메모리가 줄어든다!
var country = (82 , "KR", "Korea") // List
print(country)
print(country.0 , country.1 , country.2)

var country1 = (dialCode1:82 , isoCode1 : "KR" , name1 : "Korea") // Map
print(country1.name1)
print(country1.2) // 이름, 번호 둘 다 사용 가능하다

let person1 = ("John Doe" , "201 Main Street" , 35)
// John Doe lives at 201 Main street and is 35 years old.
print("\(person1.0) lives at \(person1.1) and is \(person1.2) years old.")

// Type 별칭 (alias)
// 기존 Type이든 사용자 Type이든 별칭을 사용할 수 있다.
typealias MyInt = Int
let age: MyInt = 20
typealias 정수 = Int
let age1 : 정수 = 20
// --------------- 위처럼은 사용하지 않는다.
// typealias 는 튜플을 썼을 때 사용한다
typealias person = (name1 :String , height1:Int , marriage1 : Bool)

var t1 : person = ("유비" , 180 , true)
var t2 : person = ("관우" , 185 , true)

print(t1)
print(t1.0 , t1.height1)

/*
 Tuple을 사용하여 직사각형의 넓이와 둘레를 계산하시오
 - 직사각형의 속성 : 이름, 가로길이, 세로길이, 넓이, 둘레
 - 넓이 : 가로 * 세로
 - 둘레 : (가로 + 세로) * 2
 */
typealias rectangle = (recname : String , w: Int , h: Int , area: Int , border: Int)

var r1 :rectangle = ("직사각형1" , 5 , 6, 0, 0)
var r2 :rectangle = ("직사각형2" , 15, 7, 0, 0)

r1.area = r1.w * r1.h
r1.border = (r1.w + r1.h)*2
r2.area = r2.w * r2.h
r2.border = (r2.w + r2.h)*2

print(r1)
print(r2)

//-------------------------
// 기본 연산자
//-------------------------

// 할당 연산자 (= , asign)
let a = 2

// Tuple을 이용한 할당 연산자
//let x1 = 1
//let x2 = 2
let (x1, x2) = (1 , 2)
var (x3, x4) = (3, "Kim")

// 사칙 연산자
print(1 + 2)
print(3 - 2)
print(4 * 3)
print(10 / 3) // 정수 나눗셈 : 나눗셈의 몫
print(10 % 3) // 나눗셈의 나머지
print(10.0 / 3.0)
print(10 / 3.0)
print(10.0 / 3)
print(10 / Double(3)) // 3.3333
print(Double(10/3)) // 3.0 이미 정수로 계산된걸 실수로 바꾸는 것

// 단항 음수 연산자
let one = 1
let minusOne = -one // - : 단항 음수 연산자
let plusOne = -minusOne

// 합성 할당 연산자
var xx = 1
xx += 2
