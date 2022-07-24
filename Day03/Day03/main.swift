//
//  main.swift
//  Day03
//
//  Created by TJ on 2022/07/23.
//

import Foundation

// 비교 연산자
print(1 == 1)
print(2 == 1)
print(2 != 1)
print(2 > 1)
print(1 < 2)
print(1 >= 1)
//print(1 => 1) // Error
print(2 <= 1)

let name = "world"

if name == "world"{
    print("Hello, \(name)!")
}else{
    print("I'm sorry \(name), but I don't recognize you.")
}

print((1, "zebra") < (2, "apple")) // 튜플 첫번째에서 비교가 끝나면 두번쨰 튜플은 비교하지 않는다
print((3, "apple") < (3, "bird")) // 3,3은 같아서 비교 불가 a와 b를 비교 b가 더 크다 (알파벳 순서기준)
print((4, "dog") == (4, "dog")) // 완전히 모든 데이터가 같아야지만 같다라고 판단한다
print((4, "dog") == (4, "dof ")) // 스페이스도 글자
print(("blue" , -1) < ("purple" , 1))
print(true == false) // false // > , < 비교는 불가하다 (다른 언어처럼 1 , 0 이 아니다)

// 일반 조건 연산자
let contentHeight = 40
let hasHeader = true
let rowHeight : Int

if hasHeader { // hasHeader == true
    rowHeight = contentHeight + 50
}else{
    rowHeight = contentHeight + 20
}

print(rowHeight)

// 홀짝수 판별
let num = 10

if num % 2 == 0{ // 나머지값
    print("짝수입니다.")
}else{
    print("홀수입니다.")
}

// 삼항 조건 연산자
let contentHeight1 = 40
let hasHeader1 = true
let rowHeight1 = contentHeight1 + (hasHeader1 ? 50 : 20) // (조건 ? true : false )
print(rowHeight1)

// Nil 병합 연산자
let defaultColorName = "red"
var userDefinedColorName: String? // ? <- nil을 수용하는 변수 (Optional 변수)
//print(userDefinedColorName)

var colorNameToUse = userDefinedColorName ?? defaultColorName // a ?? b : a 가 Nil이면 b가 출력, a가 Nil이 아니면 a출력한다.
    // 기본값 주는데 사용한다. -> 사용하려면 viewDidload에서 TF에 Nil값을 넣어줘야 한다.
print(colorNameToUse)

// 범위 연산자 ...
// 1...10
// 반복문에서만 사용한다.
for i in 1...10{
    print(i)
}
// 1+2+3+4
print(1 + 2)
print(3 + 3)
print(6 + 4)

var sum = 0
sum = sum + 1
sum = sum + 2
sum = sum + 3
sum = sum + 4

var sum1 = 0
for j in 1...4{
    sum1 += j
}
print(sum1)

// 구구단 5단 출력
for i in 1..<10{
    print("5 X \(i) = \(5*i)")
}

let names = ["Anna" , "Alex" , "Brian" , "Jack"]
let count = names.count
print(count)
// 반 닫힌 범위 연산자 ..<
for i in 0..<count{
    print("Person \(i+1) : \(names[i])")
}

// 논리 연산자
// 논리 부정 연산자
let allowedEntry = false
if !allowedEntry { // false를 true로 들어오게 함
    print("Access Denied")
}

// 논리 곱 연산자 And
let enteredDoorCode = true
let passedRetinaScan = false // 홍채인식

if enteredDoorCode && passedRetinaScan{
    print("Welcome!")
}else{
    print("Access Denied")
}

// 논리 합 연산자 Or
if enteredDoorCode || passedRetinaScan{
    print("Welcome!")
}else{
    print("Access Denied")
}
