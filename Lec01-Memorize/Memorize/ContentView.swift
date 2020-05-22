//
//  ContentView.swift
//  Memorize
//
//  Created by ignasiperez.com on 19/05/2020.
//  Copyright © 2020 Ignasi Perez-Valls. All rights reserved.
//



import SwiftUI

struct ContentView: View {
  var body: some View {
    HStack {
      ForEach(0..<4) { index in
        CardView(isFaceUp: false)
      }
    } // HStack
      .padding()
      .foregroundColor(Color.orange)
      .font(Font.largeTitle)
  } // body
} // ContentView


struct CardView: View {
  var isFaceUp: Bool
  
  var body: some View {
    ZStack {
      if isFaceUp {
              RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
              RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
              Text("👻")
      } else {
        RoundedRectangle(cornerRadius: 10.0).fill()
      }
    } // ZStack
  } // body
} // CardView



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
