//
//  main.swift
//  Day01
//
//  Created by TJ on 2022/07/16.
//

import Foundation

//print("Hello, World!")

/*
 화면 출력
 */

// 문자 출력
print("안녕하세요!") // 문자는 "" 안에

// 숫자 출력
print("12345") // 문자
print("12"+"34") // 계산 불가능. 문자형식으로 붙어서 나온다.
print(12345) // 숫자
print(12+34) // 계산 가능

/*
    변수(변할수있음) / 상수 (변화하지않음)
 ---------------------------------
 상수나 변수의 작명 규칙
 ---------------------------------
 - Camel Case : 소문자대문자. function, method, variable, constant ...
 ex) studentname -> studentName, studentage -> studentAge ...
 - Pascal Case : 대문자로시작. class, struct , enum, extension ...
 ex) StudentName , StudentAge ...
 - Snake Case : underbar(_)로 연결하여 사용
 student_name, student_age
 
 * 대소문자 구분 된다.
 * 첫 글자를 숫자나 특수문자로 시작하면 안된다. _(underbar)는 사용가능하다. (* underbar의 용도는 따로 존재한다)
 */

// 상수를 이용한 출력
let message = "안녕하세요"
print(message)
print(message)

/*
 상수(let)와 변수(var)
 - 상수 : 한번 선언된 값에 대해 변경이 불가능하다. ex) 유저 아이디, 패스워드 등
 - 변수 : 한번 선언된 값에 대해 변경이 가능하다.

 - 상수 선언 방법
 : Basic Method
    let <variable name> : <type> = <value>
 : 추론적 방법 <- 값이 명확한 경우 사용
    let <variable name> = <value>
 - 변수 선언 방법
 : Basic Method
    var <variable name> : <type> = <value>
 : 추론적 방법 <- 값이 명확한 경우 사용
    var <variable name> = <value>
 */

let intLetNum1:Int = 200
let intLetNum2 = 100

var intVarNum1 : Int = 200
var intVarNum2 = 100

print(intLetNum1)
//intLetNum1 = 2000
intVarNum1 = 2000
print(intLetNum1)

/*
 상수 선언 후에 나중에 값 할당하기
 - 나중에 할당하려고 하는 상수나 변수는 타입(type)을 꼭 명시해 주어야 합니다.
 */

let sum: Int
let inputA = 100
let inputB = 200

sum = inputA + inputB
print(sum)

var nickName : String
nickName = "유비"
nickName = "관우"


//var aNum = 9
//var bNum = 10
var aNum = 9 , bNum = 10

print(aNum , bNum) // , 한칸 자동 띄어쓰기 된다.

/*
 문자열 보간법 (String Interpolation)
 : print 실행 중 문자열, 변수, 상수의 값을 쉽게 표현하기 위해 사용
 */

let studentName = "홍길동"

// 출력 방법
print("name : " + studentName)
print("name :", studentName)
print("name : \(studentName)") // \() 안에 변수명 수식 등등 들어갈 수 있다.

let stdentName2 = "name : \(studentName)" // 이렇게 사용이 가능하다

// -----------------------
let age: Int = 10

// 저는 10살 입니다.
print("저는 \(age)살 입니다.")
// 저의 형은 14살 입니다.
print("저의 형은 \(age+4)살 입니다.")

var name1:String =  "유비"
var age1:Int = 34
var gender1:String = "남자"
// 회원의 이름은 유비이고 나이는 34이며 성별은 남자 입니다.
print("회원의 이름은 \(name1)이고 나이는 \(age1)이며 성별은 \(gender1)입니다.")

// 초코파이 5개를 구매한 가격 출력
var price = 300
var cnt = 5
var total = price * cnt
print("초코파이 가격", price) // 300
print("수량 :", cnt)
print("합계 :", total)

/*
 기본 데이터 타입
 Swift의 기본 데이터 타입
 Int, Bool, Float, Double, Character, String, UInt(0,양의 정수)
 UInt : UnsignedInt
 */

// Bool
var someBool : Bool = true
someBool = false

// Int
var someInt : Int = -100
//someInt = 100.1 // Error
someInt = 100_000 // 10만 , 대신 _ 사용
someInt = 100_00_00

// UInt
var someUInt : UInt = 100
//someUInt = -100 // Error, 음수는 사용 불가능
//someUInt = someInt // Error, type, 범위가 다르기 떄문에 할당하지 못한다.

// Float
var someFloat: Float = 3.14
someFloat = 3
someFloat = 10_000.44_556

// Double
var someDouble: Double = 3.14
someDouble = 3
//someDouble = someFloat // Error , type이 다르다
someDouble = 10_000.44_556

print("Printng \(type(of: someDouble)) : \(someDouble)")

// 숫자의 Type 변환
let doubleNum : Double = 4.999999
//print(doubleNum)
var castToInt : Int = Int(doubleNum) // 소수점 뒤는 버림
//print(castToInt)
var roundToInt : Int = Int(doubleNum.rounded())
//print(roundToInt)
print("Origin : \(doubleNum), After Cast : \(castToInt), After Rounded : \(roundToInt)")

let doubleNum1 = 0.1
let intNum1 = 1
print(doubleNum1 + Double(intNum1))

// Character
var someCharacter:Character = "A" // character눈 꼭 타입 지정을 해줘야 한다.
someCharacter = "가"
someCharacter = "🥰" // Emoji 는 글자! // Edit -> Emoji&Symbols
print(someCharacter)

// String
var someString: String = "하하하😆"
//someString = someString + "웃으면 복이와요"
someString += "웃으면 복이와요"
print(someString)

//someString = String(someCharacter)

someString = """
    여러줄 문자열을 사용할 수 있습니다.
첫 줄과 마지막줄에 사용할 문자를 정의 하여야 합니다.
"""
print(someString)

// 문자열과 특수문자 (옛날 버전)
print("aa\nbb\tcc")
var wiseWords = "\""
wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
print(wiseWords)

/*
 노트북 정보 변수를 선언하고 대입하세요
 이름(문자열), 크기(정수) , 무게(실수), 가방유무(Bool), 색상(문자)
 */

var name2:String
var size1:Int
var weight1: Double // 보통 더블 많이 사용
var bag1:Bool
var color1:Character

name2 = "맥북프로"
size1 = 16
weight1 = 2.56
bag1 = false
color1 = "백"

print("이름 :", name2)
print("크기 :", size1)
print("무게 :", weight1)
print("가방 :", bag1)
print("색상 :", color1)
