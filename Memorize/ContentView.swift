//
//  ContentView.swift
//  Memorize
//
//  Created by Raden Abdul Rahman on 6/14/20.
//  Copyright © 2020 Raden. All rights reserved.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        // h stack is horizontally stacked or arranged next to each other
//        // hstack has a spacing attribute which occurs between them
//        HStack(content: {
//            // foreach does it multiple times, takes an iterator (in this case 0 to 4 not inclusive) and the content
//            // could also be called as `ForEach(0..<4) {}` as in without the content as it is the last thing argument of the foreach function or any function for that matter. you can put it ourside the function call
//            ForEach(0..<4, content: { index in
//                // returns a view of type ZStack in this case but could be any view
//                // ZStacks are organized from back to front
//                ZStack(content: {
//                    // the following creates a rectangle with the same dimensions to act as the background
//                    RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
//                    // creates a rounded rectangle with corner radius 10.0 and stroke means only the border is visible
//                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
//                    // creates text in this case an emoji
//                    Text("👻")
//                })
//            })
//        })
//            // this changes everything in our ZStack to have a foreground color of orange
//            .foregroundColor(Color.orange)
//            // the following adds padding to the ZStack
//            // you can specify the padding but it will have the standard amount if left blank
//            .padding()
//            // the following makes all text in the ZStack of size "largeTitle"
//            .font(Font.largeTitle)
//    }
//}

//  equivalent to
struct EmojiMemoryGameView: View {
    // you would not call this viewModel but it is for education purposes
    var viewModel: EmojiMemoryGame
    var body: some View {
        if viewModel.cards.count < 10 {
            return HStack {
                ForEach(viewModel.cards) { card in
                    CardView(card: card).onTapGesture { self.viewModel.choose(card: card) }
                }
            }
                .foregroundColor(Color.orange)
                .padding()
                .font(Font.largeTitle)
        } else {
            return HStack {
                ForEach(viewModel.cards) { card in
                    CardView(card: card).onTapGesture { self.viewModel.choose(card: card) }
                }
            }
                .foregroundColor(Color.orange)
                .padding()
                .font(Font.title)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                // for back of card
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}

// the following code creates the preview on the right side as we work we can preview the changes there
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
