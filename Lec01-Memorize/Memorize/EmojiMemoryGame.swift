//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by ignasiperez.com on 25/05/2020.
//  Copyright © 2020 Ignasi Perez-Valls. All rights reserved.
//

import Foundation


class EmojiMemoryGame {
  private var model: MemoryGame<String> =
    EmojiMemoryGame.createMemoryGame()
  
  
  static func createMemoryGame() -> MemoryGame<String> {
    let emojis: Array<String> = ["👻", "🎃", "🕷", ]
    
    return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
      return emojis[pairIndex]
    }
  }
  
    
  
  

  // ************************************************************
  // MARK: - Access to the Model
  //
  
  var cards: Array<MemoryGame<String>.Card> {
    model.cards
  }
  
  
  
  // ************************************************************
  // MARK: - Intent(s)
  //
  
  func choose(card: MemoryGame<String>.Card){
    model.choose(card: card)
  }
}
