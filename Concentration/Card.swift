//
//  Card.swift
//  Concentration
//
//  Created by Евгений on 21/11/2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import Foundation

struct Card {
    
    var indentifier: Int
    var isFaceUp = false
    var isMatched = false
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.indentifier = Card.getUniqueIdentifier()
    }
    
}
