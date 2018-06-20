//
//  main.swift
//  Programa1
//
//  Created by ping tseng tsai on 2018-05-03.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import Foundation

func sendTextMessage(message: String, toLover: String, inCountry: String){//external label
    print("To my love \(toLover) in \(inCountry): \(message).")
}

sendTextMessage(message: "I Miss You", toLover: "Natsuki", inCountry: "Shibuya, Japan")//internal label

func sendTextMessage(_ message: String, to Lover: String, in Country: String){//external method
    print("To my love \(Lover) in \(Country): \(message).")
}

sendTextMessage("I Miss You", to: "Natsuki", in: "Shibuya, Japan")




func isDivisibleByTwo(_ num: Int) -> Bool {
    return num % 2 == 0
}
//let this variable store a function that take int and return bool = isDivisibleByTwo
let someFunc: (Int) -> Bool = isDivisibleByTwo
print(someFunc(10))

let numbers = [4, 124, 23, 45]

func filterInts(_ numbers: [Int], _ includeNumber:(Int) -> Bool)->[Int]{
    var result = [Int]()
    for number in numbers {
        if(includeNumber(number)){
            result.append(number)
        }
    }
    return result
}

var result = filterInts(numbers, isDivisibleByTwo)
var result2 = filterInts(numbers) {(number: Int) -> Bool in return number % 2 == 0}
var result3 = filterInts(numbers) {number in number % 2 == 0}//works only when function is the last argument
var result4 = filterInts(numbers) {$0 % 2 == 0}
print(result)
print(result3)
print(result4)

let result5 = filterInts(numbers) {num in
    var sum = 0
    var number = num
    while(number > 0){
        sum += number % 10
        number = number / 10
    }
    return sum % 2 == 0
}
print(result5)
