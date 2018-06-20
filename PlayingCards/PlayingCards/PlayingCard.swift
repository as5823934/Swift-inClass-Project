//
//  PlayingCard.swift
//  PlayingCards
//
//  Created by ping tseng tsai on 2018-05-22.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible {
    var description: String {
        return String("\(suit)\(rank)")
    }
    
    var suit: Suit
    var rank: Rank
    
    enum Suit: String, CustomStringConvertible {
        var description: String {
            return self.rawValue
        }
        
        //associated value, raw value
        case spades = "♠️"
        case hearts = "❤️"
        case diamonds = "🔶"
        case clubs = "♣️"
        
        static var all = [Suit.spades, .hearts, .diamonds, .clubs]
    }
    
    enum Rank: CustomStringConvertible{
        var description: String{
            return String(order)
        }
        
        case ace
        case numeric(Int)
        case face(String)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
                
            default:
                return 0
            }
        }
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10{
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J"), .face("Q"), .face("K")]
            return allRanks
        }
    }
    
    
}
