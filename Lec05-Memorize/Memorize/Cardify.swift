//
//  Cardify.swift
//  Memorize
//
//  Created by ignasiperez.com on 09/06/2020.
//  Copyright © 2020 Ignasi Perez-Valls. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
  private let cornerRadius: CGFloat = 10.0
  private let edgeLineWidth: CGFloat = 3
  
  var isFaceUp: Bool
  
  
  func body(content: Content) -> some View {
    ZStack {
      if isFaceUp {
        RoundedRectangle(cornerRadius: cornerRadius)
          .fill(Color.white)
        RoundedRectangle(cornerRadius: cornerRadius)
          .stroke(lineWidth: edgeLineWidth)
        content
      } else {
//        if !card.isMatched {
          RoundedRectangle(cornerRadius: cornerRadius)
            .fill()
//        }
      }
    } // ZStack
  } // body
} // Cardify


extension View {
  func cardify(isFaceUp: Bool) -> some View {
    self.modifier(Cardify(isFaceUp: isFaceUp))
  }
}
