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
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        // for loop syntax is for name of incrementer, in iteratable thing (range, array etc)
        // two dots mean up to but not including
        // structs give you an init that is pre made as below but classes need to be done with equal signs or making your own one
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(isFaceUp: false, isMatched: false, content: content))
            cards.append(Card(isFaceUp: false, isMatched: false, content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
