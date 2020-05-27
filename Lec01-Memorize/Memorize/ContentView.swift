//
//  ContentView.swift
//  Memorize
//
//  Created by ignasiperez.com on 19/05/2020.
//  Copyright © 2020 Ignasi Perez-Valls. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var viewModel: EmojiMemoryGame
  
  var body: some View {
    HStack {
      ForEach(viewModel.cards) { card in
        CardView(card: card).onTapGesture {
          self.viewModel.choose(card: card)
        }
      }
    } // HStack
      .padding()
      .foregroundColor(Color.orange)
      .font(Font.largeTitle)
  } // body
} // ContentView


struct CardView: View {
  var card: MemoryGame<String>.Card
  
  var body: some View {
    ZStack {
      if card.isFaceUp {
              RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
              RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
        Text(card.content)
      } else {
        RoundedRectangle(cornerRadius: 10.0).fill()
      }
    } // ZStack
  } // body
} // CardView



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(viewModel: EmojiMemoryGame())
  }
}
