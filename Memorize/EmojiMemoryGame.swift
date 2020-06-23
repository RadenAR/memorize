//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Raden Abdul Rahman on 6/23/20.
//  Copyright © 2020 Raden. All rights reserved.
//

import SwiftUI

// if it had a superclass it would be class EmojiMemoryGame: nameOfSuperclass {}
class EmojiMemoryGame {
    
    // you should call the model game or something more descriptive
    // private means can only be changed by emoji memory game
    // the set makes it so only emoji can alter the model but others can view the model but not change (setting is private)
    //    private(set) var model: MemoryGame<String>
    
    // even more restrictive
    // example of a closure below we move the curly brace to the beginning and we replace where it is with `in`
    // we can leave out the types in the closure as they are specified in the viewmodel and thus can be inferred here
    // we can have no return as there is only one thing that is being returned
    // we dont need parenthesis as there is only one argument
    // because it is the last argument we can move it outside without a name
    // if we dont use pairindex we can take it out and replace with `_`
    // initially was:
//    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: { (pairIndex) in
//        return "👻"
//    })
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    // static makes it related to the type not the instance
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃"]
        return MemoryGame<String>(numberOfPairsOfCards: 2) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    
    // MARK: - Access to the Model
    // things that the view can see from the model
    // we want the views to be as simple as possible. thus if we must change data for presentation such as if we got it over the network we would do that in a place such as below
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents(s)
    // things that views can do to change the model
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
