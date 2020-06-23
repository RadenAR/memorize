//
//  MemoryGame.swift
//  Memorize
//
//  Created by Raden Abdul Rahman on 6/23/20.
//  Copyright © 2020 Raden. All rights reserved.
//

import Foundation

// we add cardcontent as it needs to be specified like when using an array and below in the card struct we use that type. insert String or Int etc
// cardcontent is our "dont care type"
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
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2 + 1, content: content))
        }
    }
    
    // constrains and gains, we constrain to do things this way and we gain something in using it
    struct Card: Identifiable {
        var id: Int
        // below we give an initialized dafault value
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
