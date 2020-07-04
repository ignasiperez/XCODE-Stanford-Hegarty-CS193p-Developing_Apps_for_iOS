//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by ignasiperez.com on 25/06/2020.
//  Copyright © 2020 Ignasi Perez-Valls. All rights reserved.
//

import SwiftUI

struct EmojiArtDocumentView: View {
  
  @ObservedObject var document: EmojiArtDocument
  
  
  var body: some View {
    VStack {
      ScrollView(.horizontal) {
        HStack {
          ForEach(EmojiArtDocument.palette.map { String($0) }, id:\.self) { emoji in
            Text(emoji)
              .font(Font.system(size: self.defaultEmojiSize))
          }
        }
      } // ScrollView
      .padding(.horizontal)
      Rectangle()
        .foregroundColor(.yellow)
        .edgesIgnoringSafeArea([.horizontal, .bottom])
    } // VStack
  }
  
  private let defaultEmojiSize: CGFloat = 48
  
}

