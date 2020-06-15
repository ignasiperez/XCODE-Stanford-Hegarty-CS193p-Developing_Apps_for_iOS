//
//  Cardify.swift
//  Memorize
//
//  Created by ignasiperez.com on 09/06/2020.
//  Copyright © 2020 Ignasi Perez-Valls. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
  private let cornerRadius: CGFloat = 10.0
  private let edgeLineWidth: CGFloat = 3
  
  var rotation: Double
  
  init(isFaceUp: Bool) {
    rotation = isFaceUp ? 0 : 180
  }
  
  
  var animatableData: Double {
    get { return rotation }
    set { rotation = newValue }
  }
  
  var isFaceUp: Bool {
    rotation < 90
  }
  
  
  func body(content: Content) -> some View {
    ZStack {
      Group {
        RoundedRectangle(cornerRadius: cornerRadius)
          .fill(Color.white)
        RoundedRectangle(cornerRadius: cornerRadius)
          .stroke(lineWidth: edgeLineWidth)
        content
      } // Group
        .opacity(isFaceUp ? 1 : 0)
      RoundedRectangle(cornerRadius: cornerRadius)
        .fill()
        .opacity(isFaceUp ? 0 : 1)
    } // ZStack
      .rotation3DEffect(Angle.degrees(rotation),
                        axis: (x: 0, y: 1, z: 0))
  } // body
} // Cardify


extension View {
  func cardify(isFaceUp: Bool) -> some View {
    self.modifier(Cardify(isFaceUp: isFaceUp))
  }
}
