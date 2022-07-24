//
//  main.swift
//  Day04
//
//  Created by TJ on 2022/07/24.
//

import Foundation

/*
 Optional
 - nil값을 포함 할 수도 있고, 안 할 수도 있다.
 */

var constantNum : Int = 100
// constantNum = nil
let optionalConstant : Int! = nil
let optionalConstant1 : Int? = nil

var constantNum1 : Int! = 100
print(constantNum1 + 50)

constantNum1 = nil
//print(constantNum1 + 1) // 데이터가 아예 없는 상태에서 더하기를 하려고 하니 에러가 난다.

/*
 Optional Unwrapping
 - Optional Binding (guard let(var) 방식) : nil Check하고 안전한 값만 추출 (컴퓨터 memory 안에 변수의 값이 있는지 없는지 확인하고 추출한다.)
 - Force Unwrapping (! 방식 , 확실히 nil이 아닐때만 사용한다) (check없이 (강제) 추출한다.)
 */

var myName : String? = nil
//var myName : String? = "James"
if let name = myName{
    print(name) // nil이 아니면
}else{
    print("myName = nil") // nil이면
}

var myName2 : String? = "James"
var yourName2 : String? = nil

if let name = myName2 , let friend = yourName2{
    print("\(name) and \(friend)")
}

yourName2 = "Cathy"
if let name = myName2 , let friend = yourName2{
    print("\(name) and \(friend)")
}

//print(yourName2) // Optional("Cathy")
print(yourName2!) // Cathy

yourName2 = nil
//print(yourName2!) // Thread 1: Fatal error: Unexpectedly found nil while unwrapping an Optional value
//위 에러 뜨면서 죽어버림 -> Optional Error 처리 필요

// -----------------------
// Collection
// -----------------------
/*
 - 여러 값들을 묶어서 하나의 변수로 사용
 1) Array(배열) : 순서가 있는 리스트 컬렉션 *
 2) Dictionary(Map) : Key 와 Value의 쌍으로 이루어진 컬렉션
 3) Set(집합) : 순서가 없고 중복 데이터가 없는 집합 연산 - 분석떄 사용
 */

// Array
// 빈 Int Array 생성
var intVariable : Array<Int> = Array<Int>() // < > <- Generic , Array 데이터의 타입
var intVariable1 : [Int] = [Int]()
var intVariable2 : [Int] = [] // 제일 많이 사용하는 형식

var intVariable3 = [1,2,3] // 데이터 있는 경우

// 빈 Array에 Data 추가
intVariable.append(1)
intVariable.append(10)
intVariable.append(100)

print(intVariable) // 들어간 순서대로

// 찾기
print(intVariable.contains(100)) // Array에 100이란 데이터가 있는지 T/F
print(intVariable.contains(99))

// 계산
print(intVariable[0] + intVariable[1])

// 출력
print(intVariable[0...1])

// 수정
intVariable[0] = 999
print(intVariable)

// 삭제
intVariable.remove(at: 0)
print(intVariable)

intVariable.removeLast()
print(intVariable)

// 전체 삭제
intVariable = []
intVariable.removeAll()
print(intVariable)

// 갯수
print(intVariable.count)

// 기본값으로 설정된 배열 생성하기
var fiveDoubles : [Double] = [0.0 , 0.0, 0.0, 0.0, 0.0]
var fiveDoubles2 = Array(repeating: 0.0, count: 5)
var anotherFiveDuble = Array(repeating: 2.5, count: 5)

// 배열 합치기
var tenDoubles = fiveDoubles + anotherFiveDuble
print(tenDoubles)

// 배열 더하기
var fiveSumDoubles : [Double] = []
for i in 0..<fiveDoubles.count{
    fiveSumDoubles.append(fiveDoubles[i] + anotherFiveDuble[i])
}
print(fiveSumDoubles)

// 문자를 이용한 배열의 생성
var shoppingList:[String] = ["Eggs" , "Milk"] // 주로 사용
print(shoppingList)

var shoppingList2 : [String] = [String](repeating: "abc", count: 3)
print(shoppingList2)

// 데이터 불러오기
for i in 0..<shoppingList.count{
    print(shoppingList[i])
}
for i in shoppingList{
    print(i) // <- 추천 *
}
for i in ["a" , "b", "c" ]{
    print(i)
}

print("The Shopping list contains \(shoppingList.count) items.")

//shoppingList = []
if shoppingList.isEmpty{
    print("The Shopping list is empty.")
}else{
    print("The Shopping list contains \(shoppingList.count) items.")
}

// 배열에 데이터 추가
shoppingList.append("Four")
print(shoppingList.count , shoppingList)

shoppingList += ["Baking Powder"]
print(shoppingList.count , shoppingList)

// 한번에 여러 데이터 추가
shoppingList += ["Chocolate Spread" , "Cheese" , "Butter"]
print(shoppingList.count , shoppingList)

// 배열의 특정 위치 데이터 불러오기
var firstItem = shoppingList[0]
print(firstItem)

// 배열의 특정 위치 변경 및 제거
print(shoppingList[4...6])
shoppingList[4...6] = ["Bananas" , "Apples"] // 한꺼번에 변경 및 제거
//shoppingList[4,6] // 이런거 안됨
print(shoppingList)

// 배열의 특정 위치에 데이터 추가
// 이동 = 삭제 + 추가
shoppingList.insert("Mayple Syrup", at: 0)
print(shoppingList.count , shoppingList)

for (index , value) in shoppingList.enumerated(){ // 데이터 열거
    print("Item \(index + 1) : \(value)")
}

// 배열의 합계 구하기 및 최대값 찾기
let arr = [12,23,45,67,89,13,25,37]

var tot = 0
for i in arr{
//    print(i)
    tot += i
}
print(tot)

var max = arr[0]
for j in arr{
    if max < j{
        max = j
    }
}
print("최대값 : \(max)")
print("최대값 : \(arr.max()!)")


