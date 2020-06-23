//
//  MemoryGame.swift
//  Memorize
//
//  Created by ignasiperez.com on 25/05/2020.
//  Copyright © 2020 Ignasi Perez-Valls. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
  private(set) var cards: Array<Card>
  
  private var indexOfTheOneAndOnlyFaceUpCard: Int? {
    get {
      cards.indices.filter {
        cards[$0].isFaceUp
      }.only
    } // get
    set {
      for index in cards.indices {
        cards[index].isFaceUp = index == newValue
      }
    } // set
  }
  
  
  mutating func choose(_ card: Card) {
    print("MemoryGame - choose(_ card: Card)")
    print(" - card: \(card)")
    
    if let chosenIndex = cards.firstIndex(matching: card),
      !cards[chosenIndex].isFaceUp,
      !cards[chosenIndex].isMatched {
      
      if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
        if cards[chosenIndex].content == cards[potentialMatchIndex].content {
          cards[chosenIndex].isMatched = true
          cards[potentialMatchIndex].isMatched = true
        }
        cards[chosenIndex].isFaceUp = true
      }
      else {
        print("Card not found!")
        indexOfTheOneAndOnlyFaceUpCard = chosenIndex
      } // if let potentialMatchIndex
    } // if let potentialMatchIndex
    
  } // mutating func choose(...)
  
  
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
    cards.shuffle()
  }
  
  
  struct Card: Identifiable {
    var isFaceUp: Bool = false {
      didSet {
        if isFaceUp {
          print("Card - isFaceUp true")
          startUsingBonusTime()
        } else {
          print("Card - isFaceUp false")
          stopUsingBonusTime()
        }
      }
    }
    
    var isMatched: Bool = false {
      didSet {
        stopUsingBonusTime()
      }
    }
    
    var content: CardContent
    var id: Int
    
    // ***************************************************************
    // MARK: - Bonus time
    //
    
    // This could give matching bonus points if the user matches
    // the card before a certain amount of time passes during which
    // the card is face up.
    
    // Can be zero which means "no bonus available" for this card
    var bonusTimeLimit: TimeInterval = 24
    
    // The last time this card was turned face up (and is still face up)
    var lastFaceUpDate: Date?
    
    // The acumulated time this card has been face up in the past.
    // (i.e not including the current time it's been face up if it is currently so)
    var pastFaceUpTime: TimeInterval = 0;
    
    // How long this card has ever been faced up.
    private var faceUpTime: TimeInterval {
      if let lastFaceUpDate = self.lastFaceUpDate {
        return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
      } else {
        return pastFaceUpTime
      }
    }
    
    // How much time left before the bonnus opportunity runs out.
    var bonusTimeRemaining: TimeInterval {
      max(0, bonusTimeLimit - faceUpTime)
    }
    
    // Percentage of the bonus time remaining
    var bonusRemaining: Double {
      (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
    }
    
    // Whether the card was matched during the bonus time period.
    var hasEarnedBonus: Bool {
      isMatched && bonusTimeRemaining > 0
    }
    
    // Whether we are currently face up,
    // unmatched and have not yet used up the bonus window.
    var isConsumingBonusTime: Bool {
      print("Card - ConsumingBonusTime")
      return isFaceUp && !isMatched && bonusTimeRemaining > 0
    }
    
    // Called when the card transition to face up state
    private mutating func startUsingBonusTime() {
      print("Card - startUsingBonusTime()")
      print(" - isConsumingBonusTime: \(isConsumingBonusTime)")
      print(" - lastFaceUpDate: \(String(describing: lastFaceUpDate))")
      if isConsumingBonusTime, lastFaceUpDate == nil {
        lastFaceUpDate = Date()
      }
    }
    
    // Called when the card goes back face down (or gets matched)
    private mutating func stopUsingBonusTime() {
      print("Card - stopUsingBonusTime()")
      pastFaceUpTime = faceUpTime
      self.lastFaceUpDate = nil
    }
    
  } // struct Card
  
} // struct MemoryGame<CardContent>
