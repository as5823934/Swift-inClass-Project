//
//  PlayingCardDeck.swift
//  PlayingCards
//
//  Created by ping tseng tsai on 2018-05-22.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import Foundation

struct PlayingCardDeck {
    var cards = [PlayingCard]()
    
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                //designated init (struct has default init)
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
            // random int from 0..<cards.count
            return cards.remove(at: cards.count.randomInt)
            //remove from cards array -> modifying PlayingCardDeck object
        }
        return nil
    }
}

extension Int {
    var randomInt: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
