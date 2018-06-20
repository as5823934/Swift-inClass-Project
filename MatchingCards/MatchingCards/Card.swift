//
//  Card.swift
//  MatchingCards
//
//  Created by ping tseng tsai on 2018-05-15.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import Foundation
//struct vs class
// - struct: value type, class: reference type
// - inheritance: use class
// - no inheritance: use struct

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierMaker = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierMaker += 1
        return identifierMaker
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

extension Card : Hashable {
    var hashValue: Int {
        return identifier
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
