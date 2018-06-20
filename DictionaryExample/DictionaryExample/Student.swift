//
//  Student.swift
//  DictionaryExample
//
//  Created by ping tseng tsai on 2018-05-08.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import Foundation

//Type - class(ref), struct(val), enum(val)

struct Student : Hashable{
    var name: String
    private(set) var score: Int
    
    var hashValue: Int {
        return name.hashValue + score * 17 % 2 + 33
    }
    static func == (lhs: Student, rhs: Student) -> Bool{
        return lhs.name == rhs.name
    }
    
}





