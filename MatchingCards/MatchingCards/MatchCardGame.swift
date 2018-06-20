//
//  MatchCardGame.swift
//  MatchingCards
//
//  Created by ping tseng tsai on 2018-05-15.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import Foundation
//API: A set of emthods and vars

struct MatchCardGame {
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyCardFacedUp: Int?{
        get {
            var foundIndex: Int?
            for i in cards.indices {
                if cards[i].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = i
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        } set {
            for i in cards.indices {
                cards[i].isFaceUp = (i == newValue)
            }
            
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "MatchCardGame.chooseCard(ar: \(index): chosen index not in the cards.")
        if !(cards[index].isMatched){
            if let matchIndex = indexOfOneAndOnlyCardFacedUp,  matchIndex != index {
                // theres one and only card faced up
                if (cards[matchIndex] == cards[index]) {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else{
               
                indexOfOneAndOnlyCardFacedUp = index
            }
        }
    }
        
    init(numberOfPairsOfCards: Int) {
        //condition use for debug
        assert(numberOfPairsOfCards > 0, "MatchCardGame.init(\(numberOfPairsOfCards): you must have at least 1 pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card] //appending two object
        }
        //MARK: shuffle
        cards.shuffle()
    }
}

extension Array {
    mutating func shuffle() {//mutating self array
        for _ in indices {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}

//extension Array {
//    mutating func shuffle2() {
//        if count < 2 { return }
//        for i in 0..<(count - 1) {
//            let j = Int(arc4random_uniform(UInt32(count - i))) + i
//            self.swapAt(i, j)
//        }
//    }
//}
