//
//  ViewController.swift
//  MatchingCards
//
//  Created by ping tseng tsai on 2018-05-14.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //only create untill we access this
    private lazy var game = MatchCardGame(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    private var flipCount: Int = 0 {
        didSet {
            flipcountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipcountLabel: UILabel!
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            
            updateUIFromModel()

        }else{
            print("Chosen card was not in cardBtn")
        }
    }
    
    private func updateUIFromModel() {
        for i in cardButtons.indices{
            let button = cardButtons[i]
            let card = game.cards[i]
            
            // && flipcount
            if(card.isFaceUp) {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
                if(flipCount % 2 == 0){
                    Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { (timer) in
                        button.setTitle("", for: .normal)
                        button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                    }
                }
                
            }
        }
    }
    
    private var emojiChoices = ["🎃", "👻", "😸", "🦉", "👺", "🐟", "💩", "🤖", "🐴", "🐶"]
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card] ?? "!"
    }
}

