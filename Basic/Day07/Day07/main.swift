//
//  main.swift
//  Day07
//
//  Created by TJ on 2022/08/06.
//

import Foundation
// Structure <-> Class
// 구조체
// 구조체는 Swift에서 Type을 정의한다.

// 구조체 정의
struct Sample { // 구조체 이름은 대문자로 시작한다. (class와 동일)
    var sampleproperty : Int = 10 // 가변 프로퍼티
    let fixedSampleProperty : Int = 100 // 불변 프로퍼티
    static var typeProperty : Int = 1000 // 타입 프로퍼티
    // 함수
    func instanceMethod(){
        print("Instance method")
    }
    static func typeMethod(){
        print("Type method")
    }
}
// 구조체 사용
var samp : Sample = Sample()
print("가변 변수 사용 :", samp.sampleproperty)
// func과 비슷한면이 있다. 하지만 struct는 func도 수용이 가능하다
samp.sampleproperty = 100
print("가변 변수 변경 후 :" , samp.sampleproperty)
//samp.fixedSampleProperty = 1000 // 불변 프로퍼티는 변경 불가능하다

var samp1 : Sample = Sample() // instance , 타입 프로퍼티는 이렇게 사용하지 않는다.
print(samp1.sampleproperty) // 화면이 넘어가면 기본값이 다시 나온다. 데이터 공유가 안된다.

Sample.typeProperty = 300 // Instance를 만들지 않고 직접 struct의 원본 값을 바꾸는 것. 바꾼 후 어디에서 불러 사용해도 바꾼 값이 나온다.
// 활용예시 - 로그인 후 아이디를 계속 가져가고 싶을 때, 아이디를 struct의 static으로 넣어주고 다른 화면들에서 아이디를 사용한다.
// 웹을 수천명이 들어오기 때문에 static을 자제 (메모리에 올라가기 때문), 앱은 사용자 한명만 사용하기 때문에 static 사용 무관

samp.instanceMethod() // print 실행된다
Sample.typeMethod() // static func
// 두개의 사용법이 다름

// --------------
// 학생 구조체 생성
struct Student{
    var name : String = "unknown"
    var `class` : String = "Swift" // 키워드를 변수로 쓰는 방법 tab위에 있는 ₩키
    
    static func selfIntroduce(){
        print("학생 타입 입니다.")
    }
    func selfIntroduce(){ // static func와 func는 그냥 다르게 인식한다. override도 아님
//        print("저는 \(`class`)반 \(name) 입니다.")
        print("저는 \(self.class)반 \(name)입니다.") // self. : Student의 전역변수를 가져와 사용하겠다
    }
}

// 타입 확인 : Static 으로 주로 만듦
Student.selfIntroduce()

// Instance
var student : Student = Student()
student.name = "James"
student.class = "스위프트"
student.selfIntroduce()

var cathy : Student = Student()
cathy.name = "Cathy"
cathy.selfIntroduce()
// -----------------

// Class
class SampleC {
    var sampleproperty : Int = 10 // 가변 프로퍼티
    let fixedSampleProperty : Int = 100 // 불변 프로퍼티
    static var typeProperty : Int = 1000 // 타입 프로퍼티
    // 함수
    func instanceMethod(){
        print("Instance method")
    }
    static func typeMethod(){
        print("Type method")
    }
}

var sampC : SampleC = SampleC()
sampC.sampleproperty = 500
print(sampC.sampleproperty)

// 상속 외 다른 차이점
samp.sampleproperty = 200
print(samp.sampleproperty)

var samp2 : Sample = Sample()
samp2.sampleproperty = 500
print("samp = 200, samp2 = 500")
print("samp",samp.sampleproperty)
print("samp2",samp2.sampleproperty)

samp = samp2
print("samp = samp2")
print("samp",samp.sampleproperty)
print("samp2",samp2.sampleproperty)

// -----
// 학생 클래스 생성
class StudentC{
    var name : String = "unknown"
    var `class` : String = "Swift" // 키워드를 변수로 쓰는 방법 tab위에 있는 ₩키
    
    static func selfIntroduce(){
        print("학생 타입 입니다.")
    }
    func selfIntroduce(){ // static func와 func는 그냥 다르게 인식한다. override도 아님
//        print("저는 \(`class`)반 \(name) 입니다.")
        print("저는 \(self.class)반 \(name)입니다.") // self. : Student의 전역변수를 가져와 사용하겠다
    }
}

let james : StudentC = StudentC()
james.name = "James"
james.selfIntroduce()
// 사용법이 struct와 다를바 없다. 따라서 swift에서는 상속을 사용할 일이 없으면 struct를 사용하는게 빠르다.

// 클래스와 구조체
// : 프로그램의 코드를 조직화 하기 위해 일반적으로 사용합니다.

// video
/*
화면 해상도 Resolution - FHD 1920 x 1080 / 4K 4096 /
Interlace - NTSC(미국) 짝수 출력 / PAL (유렵) 홀수 출력
fps - FrameRate
 */
struct Resolution{
    var width = 0
    var height = 0
}
class VideoMode{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name : String?
}

var someResolution : Resolution = Resolution()
var someVideoMode = VideoMode()
print("The width of someVideoMode is \(someVideoMode.resolution.width) ")

someResolution.width = 1920
print("The width of someVideoMode is \(someVideoMode.resolution.width) ") // someVideoMode와 someResolution은 모르는 사이라 값이 들어가지 않는다.
someVideoMode.resolution.width = 1920
print("The width of someVideoMode is \(someVideoMode.resolution.width) ")

let vga =  Resolution(width: 640, height: 480)
var cinema = vga
print("Cinema is now \(cinema.width) pixels wide.")

// -
class Exam{
    var name = ""
    var score : [Int] = [] // 과목이 몇개 들어올지 모르기 때문에 리스트로 선언
    var tot = 0 , avg = 0
    
    func input(_ nn:String , _ jj : Int... ){
        name = nn
        score = jj
        calc() // 계산
        result() // 결과값
    }
    // 계산
    func calc(){
        tot = 0
        for i in score{
            tot += i
        }
        avg = tot / score.count
    }
    func result(){
        print(name , score , tot , avg)
    }
} // exam

let st1 : Exam = Exam()
let st2 : Exam = Exam()
let st3 : Exam = Exam()
let st4 : Exam = Exam()

st1.input("유비", 77,78,71)
st2.input("관우", 90,80,65,43)
st3.input("장비", 97,98)
st4.input("조조", 67,68,69)

// - 도형
class Shape{
    var kind = ""
    var area = 0.0
    var border = 0.0
    
    func input(_ r : Double){
        kind = "원"
        let pi = 3.141592
        area = r * r * pi
        border = 2 * pi * r
        result()
    }
    func input(_ w : Double , _ h : Double){
        kind = "직사각형"
        area = w * h
        border = 2 * (w + h)
        result()
    }
    func input(_ a : Double , _ b : Double , _ c : Double){
        kind = "직각삼각형"
        area = a * b / 2
        border = a + b + c
        result()
    }
    func result(){
        print("\(kind) : area \(Int(area)) , border \(Int(border))")
    }
}

let sh1 : Shape = Shape() // 원
let sh2 : Shape = Shape() // 직사각형
let sh3 : Shape = Shape() // 직각 삼각형
sh1.input(5)
sh2.input(5 , 6)
sh3.input(3, 4, 5) // overloading

// Class 생성자
class Shape1 {
    var area = 0.0
    let pi = 3.14
    
    init(){ // 생성자 - instance 생성시 쓰는 ()
        print("계산 시작!")
    }
    
    init(radius : Double){
        area = radius * radius * pi
        result()
    }
    // 생성자도 파라미터에 따라 여러개 만들 수 있다
    
    func input(_ r :Double){
        area = r * r *  pi
        result()
    }
    
    func result(){
        print("원의 면적은 \(Int(area))입니다. ")
    }
}

let sh4: Shape1 = Shape1()
sh4.input(5)

let sh5: Shape1 = Shape1(radius: 5)

// 연습
class Shape2 {
    var area = 0.0
    var border = 0.0
    var kind = ""
    
    init(_ radius : Double){
        let pi = 3.14
        kind = "원"
        area = radius * radius *  pi
        border = 2 * pi * radius
        result()
    }
    init(_ w : Double , _ h : Double){
        kind = "직사각형"
        area = w * h
        border = 2  * (w + h)
        result()
    }
    init(_ a : Double , _ b :Double , _ c :Double){
        kind = "직각삼각형"
        area = a * b / 2
        border = a + b + c
        result()
    }
    func result(){
        print("\(kind)의 넓이는 \(area) , 둘레는 \(Int(border))입니다.")
    }
}

let sh6 : Shape2 = Shape2(5) // 원
let sh7 : Shape2 = Shape2(5 , 6) // 직사각형
let sh8 : Shape2 = Shape2(3, 4, 5) // 직각삼각형
