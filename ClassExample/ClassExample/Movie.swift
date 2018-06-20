//
//  Movie.swift
//  ClassExample
//
//  Created by ping tseng tsai on 2018-05-09.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import Foundation

class Movie {// extend a super class or conform to the protocol
    //class- all properties have to init
    //1. give all proerties init value or
    //2. make properties optional or
    //3. create init constructor
    
    //*Stored properties
    var title: String = "" {
        didSet {
            print("Title is changed")
        }
        willSet {
            print("Title is about to be changed")
        }
    }
    
    var releaseYear: Int = 2018
    
    var director: String? // optional
    let genre: String
    
    //Computed properties: no storage
    // by default (read-only), but you can make vatiale
    var price: Int{
        return 10
    }
    
    //can use switch statment
    var price2: Int{
        get{
            switch self.releaseYear {
            case 1990...2000:
                return 5
            case 2001...2010:
                return 8
            case 2011...2018:
                return 15
            default:
                return 3
            }
        }set(newPrice){
            if newPrice > 50 {
                self.title = "\(self.title) (Popular)"
            }
        }
    }
    
    
    
    init(title: String, director: String, genre: String, releaseYear: Int = 2018) {
        //if user didnt pass releaseYear and it has default value 2018, optional
        self.genre = genre
        self.title = title
        self.director = director
        self.releaseYear = releaseYear
    }
}
