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
struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
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
        cards = cards.shuffled()
    }
    
    // constrains and gains, we constrain to do things this way and we gain something in using it
    struct Card: Identifiable {
        var id: Int
        // below we give an initialized dafault value
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
