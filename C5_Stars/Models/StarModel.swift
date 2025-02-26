//
//  StarModel.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 26/02/25.
//
import Foundation

struct Star: Identifiable {
    var id = UUID()
    var starName: String
    var starPrompt: Prompts
    var starStory: String
}
