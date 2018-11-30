//
//  Concentration.swift
//  Concentration
//
//  Created by Евгений on 21/11/2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexCardOfOnlyOneIsFaceUp: Int?
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexCardOfOnlyOneIsFaceUp, matchIndex != index {
                if cards[matchIndex].indentifier == cards[index].indentifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexCardOfOnlyOneIsFaceUp = nil
            } else {
                for flipdownIndex in cards.indices {
                    cards[flipdownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexCardOfOnlyOneIsFaceUp = index
            }
        }
    }
    
}
