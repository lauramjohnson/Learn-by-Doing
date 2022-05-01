//
//  CardModel.swift
//  Learn by Doing
//
//  Created by Laura Johnson on 4/30/22.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
