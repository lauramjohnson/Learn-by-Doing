//
//  ContentView.swift
//  Learn by Doing
//
//  Created by Laura Johnson on 4/30/22.
//

import SwiftUI

struct ContentView: View {
    var cards: [Card] = cardData
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 28) {
                ForEach(cards) { card in
                    CardView(card: card)
                }
              }
            .padding(.horizontal, 28)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
