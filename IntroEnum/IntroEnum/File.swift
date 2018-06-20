//
//  File.swift
//  IntroEnum
//
//  Created by ping tseng tsai on 2018-05-07.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import Foundation

//enum a set of options
//enum is a VALUE type (like struct)

//associated data
enum FastFoodMenuItem{
    case hamburger(numberOfPatties: Int)
    case fries(size: FryOrderSize)
    case drink(brand: String, ounces: Int)
    case cookie
    
    //mutating is required because enum is a value type
    mutating func switchToBeingACookie(){//mutating func: modfiing the self value
        self = .cookie
    }
    
    func isIncludedInSpecialOrder(number: Int) -> Bool{
        switch self {
        case .hamburger(let patties): return patties == number
        case .fries, .cookie: return true
        case .drink(_, let ounces): return ounces == 16// '_' could be anything
        }
    }
    //swift: stored properties, computed properties
    var calories: Int{
        var total = 0
        switch self {
        case .hamburger(let patties):
            total += patties * 500
        default:
            total += 100
        }
        return total;//enum can have computer property
    }
}

enum FryOrderSize{
    case large
    case small
}
