//
//  EmojiArtDocument.swift
//  EmojiArt
//
//  Created by ignasiperez.com on 29/06/2020.
//  Copyright © 2020 Ignasi Perez-Valls. All rights reserved.
//

import SwiftUI

class EmojiArtDocument: ObservableObject {
  
  static let palette: String = "🌝🌼🌸🌲🌳🌵🌴🌿🌹🌷"
  
  @Published private var emojiArt: EmojiArt = EmojiArt()
  
  @Published private(set) var backgroundImage: UIImage?
  
  var emojis: [EmojiArt.Emoji] { emojiArt.emojis}
  
  // ************************************************************
  // MARK: - Intent(s)
  //
  
  func addEmoji(_ emoji: String,
                at location: CGPoint,
                size: CGFloat) {
    
    emojiArt.addEmoji(emoji,
                      x: Int(location.x),
                      y: Int(location.y),
                      size: Int(size))
  } // func addEmoji
  
  
  func moveEmoji(_ emoji: EmojiArt.Emoji, by offset: CGSize) {
    if let index = emojiArt.emojis.firstIndex(matching: emoji) {
      emojiArt.emojis[index].x += Int(offset.width)
      emojiArt.emojis[index].y += Int(offset.height)
    }
  } // func moveEmoji
  
  
  func scaleEmoji(_ emoji: EmojiArt.Emoji,
                  by scale: CGFloat) {
    
    if let index = emojiArt.emojis.firstIndex(matching: emoji) {
      emojiArt.emojis[index].size =
        Int((CGFloat(emojiArt.emojis[index].size) *
          scale.rounded(.toNearestOrEven)))
    }
  } // func scaleEmoji
  
  
  func setBackgroundURL(_ url: URL?) {
    emojiArt.backgroundURL = url?.imageURL
    fetchBackgroundImageData()
  }
  
  
  private func fetchBackgroundImageData() {
    backgroundImage = nil
    
    if let url = self.emojiArt.backgroundURL {
      DispatchQueue.global(qos: .userInitiated).async {
        if let imageData = try? Data(contentsOf: url) {
          DispatchQueue.main.async {
            if url == self.emojiArt.backgroundURL {
              self.backgroundImage = UIImage(data: imageData)
            }
          } // .async main
        } // Data(contentsOf: url)
      } // .async qos
    } // if let url
  } // fetchBackgroundImageData()
  
}

extension EmojiArt.Emoji {
  var fontSize: CGFloat { CGFloat(self.size) }
  var location: CGPoint { CGPoint(x: CGFloat(x), y: CGFloat(y))}
}
