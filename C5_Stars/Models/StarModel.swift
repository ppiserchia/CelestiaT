//
//  StarModel.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 26/02/25.
//


/// The StarModel is going to identify how the star is going to be structured in terms of the properties that compose the star.

import Foundation

struct StarModel: Identifiable {
    let id = UUID()
    var starName: String
    var starPrompt: Prompt
    var user: String
    var starStory: String
}
