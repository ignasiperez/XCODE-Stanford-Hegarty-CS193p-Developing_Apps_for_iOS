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
    Grid(viewModel.cards) { card in
      CardView(card: card).onTapGesture {
        self.viewModel.choose(card: card)
      }
      .padding(5)
    } // Grid
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
  
  @ViewBuilder
  private func body(for size: CGSize) -> some View {
    if card.isFaceUp || !card.isMatched {
      ZStack {
        Pie(startAngle: Angle.degrees(0-90),
            endAngle: Angle.degrees(110-90),
            clockwise: true
        )
          .padding(5)
          .opacity(0.4)
        Text(self.card.content)
          .font(Font.system(size: fontSize(for: size)))
      } // ZStack
        .cardify(isFaceUp: card.isFaceUp)
    } // if
  } // body
  
  
  
  // ************************************************************
  // MARK: - Drawing Constants
  //
  
  private func fontSize(for size: CGSize) -> CGFloat {
    min(size.width, size.height) * 0.70
  }
} // CardView



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let game = EmojiMemoryGame()
    game.choose(card: game.cards[0])
    return EmojiMemoryGameView(viewModel: game)
  }
}
