//
//  main.swift
//  IntroEnum
//
//  Created by ping tseng tsai on 2018-05-07.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import Foundation

var MihoOrder: FastFoodMenuItem = .hamburger(numberOfPatties: 5)


print(MihoOrder.isIncludedInSpecialOrder(number: 5))
print(MihoOrder.calories)
MihoOrder.switchToBeingACookie()

switch MihoOrder{
case .hamburger(let patties):
    if patties > 2{
        print("Thats too much !\(patties) patties Burgers?!")
    } else{
        print("\(patties) patties Burgers!")
    }
    
case .fries(let size): print("\(size) fries!")
case .drink(let brand, let ounces): print("\(brand) drink \(ounces) ounces")
case .cookie: print("cookie!")
}

var x: String?
var y = x ?? "some"//if 'x' if not nil put something
//same as: //switch x{
            //case .none:break
            //case .some(let data): y = data
            //}
//var z = x? .uppercased()
//same as: //switch x{
            //case .none: z = nil
            //case .some(let data):
            //    z = data.uppercased()
            //}

