//
//  main.swift
//  FunctionsExample
//
//  Created by ping tseng tsai on 2018-05-08.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import Foundation

//Higher-order functions - function that takes a function
//Closure - function without a name
//ex) (String) -> Bool : reference

var students = ["Miho", "Ryuma", "Kana", "Lucas", "Ayako", "Eric", "Cadiz", "Tima", "Dexun"]

var st = students.filter({(name: String) -> Bool in
    return name.count > 4
})
//a function return anther function, which take an int and return an int
var nameMoreThan4Chars = {(name: String, age: Int) ->  ((Int) -> Int) in
    let x = age
    print(name, x)
    return {(val:Int) -> Int in return val * 7}
}

print(st)
print(nameMoreThan4Chars("Hunter", 29)(10))

var element = { (tag: String) -> ((String) -> Void) in
    let start = "<\(tag)>"
    let end = "</\(tag)>"
    return {(content:String) in
        print("\(start)\(content)\(end)")
    }
}
var p = element("p")
p("What is this going to print?")
p("Hello world")
var h1 = element("h1")
h1("Welcome to my webpage")


var word = "can"
var firstLetter = word[word.startIndex]
var newWord = ""
var vowels: [Character] = ["a", "e", "i", "o", "u"]

//if vowels.contains(firstLetter) {
//    newWord = word + "yay"
//} else {
//    word.remove(at: word.startIndex)
//    newWord = "\(word)\(firstLetter)ay"
//}
var first = vowels.contains(firstLetter)
switch first{
case true:
    newWord = word + "yay"
default:
    word.remove(at: word.startIndex)
    newWord = "\(word)\(firstLetter)ay"
}
print(newWord)

