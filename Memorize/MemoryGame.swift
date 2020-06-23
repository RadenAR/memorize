//
//  MemoryGame.swift
//  Memorize
//
//  Created by Raden Abdul Rahman on 6/23/20.
//  Copyright © 2020 Raden. All rights reserved.
//

import Foundation

// we add cardcontent as it needs to be specified like when using an array and below in the card struct we use that type. insert String or Int etc
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
