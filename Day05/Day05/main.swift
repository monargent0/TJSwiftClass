//
//  main.swift
//  Day05
//
//  Created by TJ on 2022/07/30.
//

import Foundation

// Dictionary
// : key와 value로 구성된 컬렉션
// key가 String 타입이고 value가 Int인 빈 Dictionary 생성

//var scoreDictionary: Dictionary<String,Int> = [String:Int]() // 복잡, 사용안함
var scoreDictionary : [String:Int] = [:] // 이렇게 보통 사용한다
scoreDictionary["유비"] = 100
scoreDictionary["관우"] = 90
scoreDictionary["장비"] = 80

print(scoreDictionary)

print(scoreDictionary["유비"]!) // 옵셔널은 데이터가 있는걸 확실히 알떄는 가드어쩌고 쓸 필요 없고 느낌표 쓰면 된다.

var airports : [String : String] = ["YYZ" : "Toronto Pearson" , "DUB" : "Dublin" ]
print(airports.count , airports)

if airports.isEmpty{
    print("The airports dictionary is empty")
}else{
    print("The airports dictionary is not empty")
}
// 추가
airports["LHR"] = "London"
print(airports.count , airports)

// 수정
airports["LHR"] = "LONDON"
print(airports.count , airports)

// Set
// Set은 집합연산에 꽤 유용합니다.
// 중복값은 처리하지 않습니다.

var oddDigits : Set = [1,3,5,7,9]
var evenDigits : Set = [0,2,4,6,8]
let singleDigitPrimeNumbers : Set = [2,3,5,7]

// 추가
oddDigits.insert(1)
print(oddDigits.sorted()) // 중복값을 반영하지 않는다.

// 합집합
print(oddDigits.union(evenDigits).sorted())

// 교집합
print(oddDigits.intersection(evenDigits).sorted())

// 차집합
print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())

// 여집합
print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())

//-------
let houseAnimals:Set = ["dog","cat"]
let farmAnimals:Set = ["cow","chicken","sheep","dog","cat"]
let cityAnimals:Set = ["duck","rabbit"]

// is ~ , bool
print(houseAnimals.isSubset(of: farmAnimals)) // 부분집합인지 여부
print(farmAnimals.isSuperset(of: houseAnimals)) // 상위집합 여부
print(farmAnimals.isDisjoint(with: cityAnimals)) // 따로 떨어진 집합인지, (교집합이 없는것)

/*
 열거형(enumerate)
 - 연관된 항목들을 묶어서 표현할 수 있는 타입
 - 배열, 딕셔너리, 셋 과는 다르게 프로그래머가 정의해준 항목 값 외에는 추가, 수정이 불가하다.
 - 주로 분석에서 사용하는 용어인 범주(Category)와 동일한 의미
 */

// 타입 정의
enum School:String{
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

let highestEducation:School = .university // 대학교라는 데이터를 가져온것
print("저의 최종학력은 \(highestEducation.rawValue) 졸업 입니다.")
// 출력:highestEducation = university , highestEducation.rawValue = 대학교 , highestEducation.hashValue = 의문의 숫자들

//-----------------------
// 조건문
//-----------------------

// if 조건문
let someInteger = 100

if someInteger == 100{
    print("100점")
}

if someInteger == 100{
    print("100점")
}else{
    print("100점이 아님")
}

if someInteger < 100 {
    print("100 미만")
}else if someInteger > 100{
    print("100 초과")
}else{
    print("100점")
}

// Tuple
var isCar = true
var isNew = true

if isCar , isNew { // , = and , isCar == true , isNew == true와 같다
    print("New Car")
}

isNew = false
if isCar , isNew{
    print("New Car")
}else{
    print("Old Car")
}

// Switch 조건문 (if문 속도 개선한거)
// 범위 연산자를 활용하면 더욱 쉽고 유용 합니다.

// Before using switch statment
let personAge = 14

if personAge < 1 {
    print("baby")
}else if personAge < 3 {
    print("toddler")
}else if personAge < 5{
    print("preschooler")
}else if personAge < 13{
    print("gradeschooler")
}else if personAge < 18{
    print("teen")
}else{
    print("adult")
}

// After using switch statment
switch personAge{
case 0..<1: print("baby")
case 1..<3: print("toddler")
case 3..<5: print("preschooler")
case 5..<13: print("gradeschooler")
case 13..<18: print("teen")
default: print("adult")
}
// swift의 case는 기본이 break가 있기 때문에 밑으로 흘러가지 않는다! 범위,&조건을 줄 수 있다!! 다른언어와 차별점

//---------
let someCharacter : Character = "z"
switch someCharacter{
case "a" :
    print("The first letter of the alphabet")
case "z" :
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

print(someInteger)
switch someInteger{
case 0: print("zero")
case 1..<100: print("1-99")
case 100: print("100")
case 101...Int.max: print("over 100")
default: print("unknown")
}

switch someCharacter{
case "Z" , "z" :
    print("The letter Z")
default :
    print("Not the letter z")
}

// Tuple로 사용하기
let somePoint = (1,1)
switch somePoint{
case(0,0) :
    print("\(somePoint) is at the origin")
case(_,0) : // y값이 0인 경우, x값은 아무거나
    print("\(somePoint) is on the x-axis")
case(0,_) :
    print("\(somePoint) is on the y-axis")
case(-2...2,-2...2) :
    print("\(somePoint) is inside of the box")
default :
    print("\(somePoint) is outside of the box")
}

/*
 직급별 월급을 계산하세요
 - 부장 : 50%, 과장 : 30%, 대리 : 20%, 사원 10%
 - 월급 : 기본급 + 기본급 * 보너스
 */
let pos = "과장"
let basic = 300
var bonus : Double

switch pos {
case "부장" :
    bonus = Double(basic) * 0.5
case "과장" :
    bonus = Double(basic) * 0.3
case "대리" :
    bonus = Double(basic) * 0.2
default:
    bonus = Double(basic) * 0.1
}
print("\(pos) 기본급 \(basic) : 월급 \(Int(Double(basic) + bonus))만원")
// 과장 300 : ___ 원

// 이름, 국어, 영어, 수학에 대한 총점과 평균 그리고 등급을 출력
let name = "유비"
let kor = 91
let eng = 97
let mat = 95

/*
 이름 : 유비
 국어 : 91
 영어 : 97
 수학 : 95
 총점 : __
 평균 : --
 
 점수 등급은 수 입니다.
 */
let total = kor + eng + mat
let mean = Double(total) / 3.0
let grade : Character

switch mean{
case 90..<100 : grade = "수"
case 80..<90 : grade = "우"
case 70..<80 : grade = "미"
case 60..<70 : grade = "양"
default : grade = "가"
}

print("""
 이름 : \(name)
 국어 : \(kor)
 영어 : \(eng)
 수학 : \(mat)
 총점 : \(total)
 평균 : \(round(mean))
 
 점수 등급은 \(grade) 입니다.
""")

// 강사님 풀이 ----------------------

var tot = 0
var avg : Double = 0

tot = kor + eng + mat
avg = Double(tot) / 3

// 점수 등급 출력 - 1
var grade1 : String
if avg >= 90{
    grade1 = "수"
}else if avg >= 80{
    grade1 = "우"
}else if avg >= 70{
    grade1 = "미"
}else if avg >= 60{
    grade1 = "양"
}else{
    grade1 = "가"
}

// 점수 등급 출력 - 2
switch avg{
case 90..<100 : grade1 = "수"
case 80..<90 : grade1 = "우"
case 70..<80 : grade1 = "미"
case 60..<70 : grade1 = "양"
default : grade1 = "가"
}

// 점수 등급 출력 - 3
grade1 = avg >= 90 ? "수" :
         avg >= 80 ? "우" :
         avg >= 70 ? "미" :
         avg >= 60 ? "양" : "가"

// 점수 등급 출력 - 4
// 배열과 반복문
var score = [ 90,  80, 70,  60,  0]
var level = ["수","우","미","양","가"]
for i in 0..<score.count{
//    print(score[i] , level[i])
    if avg >= Double(score[i]){
        grade1 = level[i]
        break // 조건 맞는거 한번만 돌면 반복문(for문) 끝내기
    }
}

print("""
 이름 : \(name)
 국어 : \(kor)
 영어 : \(eng)
 수학 : \(mat)
 총점 : \(tot)
 평균 : \(avg)
 
 점수 등급은 \(grade1) 입니다.
""")

// Scope

var a = 1000
var b = 2000
var c : Int
var bo = true
print("main 1 :" , a, b, bo)

if bo{
    let aa = 111
    b += 1
    c = 99
    
    print("if 1 :",a,aa,b,c)
}else{
//    print("if 1 :",a,aa,b,c) // aa는 사용 불가능
    let aa = 5678
    print("else 1 :" ,a, aa)
    a += 10
    print("else 2:", a)
    c = 77
}

//print("main 2 :", a,b,c,aa)
print("main 2 :",a,b,c)
// 전역변수는 앱이 끝날때까지 메모리 차지, 지역변수는 한번 실행하고 메모리에서 사라짐 * 공통된 변수만 지역변수로 쓰기


// 열거형을 입력 값으로 받는 switch문
enum School2{
    case primary , elementary , middle, high , college , university , graduate
    // 이렇게 데이터를 안 넣어주면 인덱스 값이 들어간다.
}
let 최종학력 : School2 = .university

switch 최종학력{
case .primary:
    print("최종학력은 유치원 입니다.")
case .elementary:
    print("최종학력은 초등학교 입니다.")
case .middle:
    print("최종학력은 중학교 입니다.")
case .high:
    print("최종학력은 고등학교 입니다.")
case .college , .university :
    print("최종학력은 대학(교) 입니다.")
case .graduate:
    print("최종 학력은 대학원 입니다.")
}

// 반복문 for
// For-In문 (For -In Loops)
let names = ["Anna" , "Alex" , "Brian" ,"Jack"]
print(names[0])

for name in names{
    print("Hello , \(name)")
}

for (index , text) in name.enumerated(){
    print("The names at index \(index) is \(text)")
}

let numberOfLogs : [String : Int] = ["spider" : 8 , "ant" : 6 , "cat" : 4]
for (animalName, legCount) in numberOfLogs{
    print("\(animalName)s have \(legCount) legs")
}

for index in 1...5{
    print("\(index) times 5 is \(index * 5)")
}

let seq = 1...5
for index in seq{
    print("\(index) times 5 is \(index * 5)")
}
// 순서 거꾸로 (변수로 만들어서 사용한다)
for index in seq.reversed(){
    print("\(index) times 5 is \(index * 5)")
}

// 범위를 주는 index
let minutes = 60
let minuteInterval = 5
// to : 60 전 까지
for ticMark in stride(from: 0, to: minutes, by: minuteInterval){
    print(ticMark)
}
// through : 60까지
for ticMark in stride(from: 0, through: minutes, by: minuteInterval){
    print(ticMark)
}
for ticMark in stride(from: minutes, through: 0, by: -5){
    print(ticMark)
}

let strings = ["First String" , "Second String" , "Third String" , "Fourth String"]
for string in strings{
    if string.starts(with: "F"){ // F로 시작하는 것만 출력
        print(string)
    }
}

// Swift 답게 작성 ! 다른 언어에는 없다
for string in strings where string.starts(with: "F"){
    print(string)
} // for 문이 두번 돌면 끝. 다른 언어 방식은 4번 돌아야 함

// break
for string in strings{
    if string.starts(with: "T"){
        break
    }
    print(string) // T 출력하기 전에 끝남
}
// break 자주 사용한다. 10만개 단어의 사전에서 사과라는 단어를 찾을때 break가 없으면 10만개를 돌고, break가 있으면 찾고 바로 끝낸다. 퍼포먼스의 차이를 만든다.

// continue , 반복을 계속해라
for string in strings{
    if string.starts(with: "F"){
        continue // 밑으로 가지 않고 다시 반복문이 돈다.
    }
    print(string) // F를 제외한 단어를 출력하게 된다.
}

// 활용방법
var intArray : [Int] = []
for i in 1...100{
    if i % 2 == 1{
        continue
    }
    intArray.append(i)
}
print(intArray)

// While , 무한정 반복
var startIndex = 0
var endIndex = 100
var sum = 0

while startIndex <= endIndex{
    sum += startIndex
    startIndex += 1
}

print("while :", sum)

// while문을 이용하여 1부터 100까지의 수중 짝수의 합을 구하시오
// ( 단 , if 문을 사용하지 마세요)
sum = 0
startIndex = 0
while startIndex <= endIndex{
    sum += startIndex
    startIndex += 2
}
print("짝수 합 :",sum)

var i1 = 2
var tot1 = 0

while true{
    tot1 += i1
    i1 += 2
    if i1 > 100{
        break
    }
}
print("even result :", tot1)
