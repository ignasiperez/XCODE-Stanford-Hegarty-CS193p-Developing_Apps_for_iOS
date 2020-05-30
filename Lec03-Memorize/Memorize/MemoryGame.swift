//
//  MemoryGame.swift
//  Memorize
//
//  Created by ignasiperez.com on 25/05/2020.
//  Copyright © 2020 Ignasi Perez-Valls. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
  var cards: Array<Card> // <- Not a good place to initialize the cards
  
  
  mutating func choose(_ card: Card) {
    print("card chosen: \(card)")
    
    let chosenIndex: Int = index(of: card)
    cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
  }
  
  
  func index(of card: Card) -> Int {
    for index in 0..<cards.count {
      if cards[index].id == card.id {
        return index
      }
    }
    return 0 // TODO: bogus!
  }
  
  
  init(numberOfPairsOfCards: Int,
       cardContentFactory: (Int) -> CardContent) {
    cards = Array<Card>()
    
    for pairIndex in 0..<numberOfPairsOfCards {
      let content = cardContentFactory(pairIndex)
      
      cards.append(Card(content: content,
                        id: pairIndex*2))
      cards.append(Card(content: content,
                        id: pairIndex*2+1))
    }
  }
  
  
  struct Card: Identifiable {
    var isFaceUp: Bool = true
    var isMatched: Bool = false
    var content: CardContent
    var id: Int
  }
}
