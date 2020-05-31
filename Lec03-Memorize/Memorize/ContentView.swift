//
//  ContentView.swift
//  Memorize
//
//  Created by ignasiperez.com on 19/05/2020.
//  Copyright © 2020 Ignasi Perez-Valls. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject var viewModel: EmojiMemoryGame
  
  var body: some View {
    HStack {
      ForEach(viewModel.cards) { card in
        CardView(card: card).onTapGesture {
          self.viewModel.choose(card: card)}
      }
    } // HStack
      .padding()
      .foregroundColor(Color.orange)
  } // body
} // EmojiMemoryGameView


struct CardView: View {
  var card: MemoryGame<String>.Card
  
  var body: some View {
    GeometryReader { geometry in
      self.body(for: geometry.size)
    }
  } // body
  
  
  func body(for size: CGSize) -> some View {
    ZStack {
      if self.card.isFaceUp {
        RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
        RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
        Text(self.card.content)
      } else {
        RoundedRectangle(cornerRadius: cornerRadius).fill()
      }
    } // ZStack
      .font(Font.system(size: fontSize(for: size)))
  }
  
  
  
  // ************************************************************
  // MARK: - Drawing Constants
  //

  let cornerRadius: CGFloat = 10.0
  let edgeLineWidth: CGFloat = 3
  
  func fontSize(for size: CGSize) -> CGFloat {
    min(size.width, size.height) * 0.75
  }
} // CardView








struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
  }
}
