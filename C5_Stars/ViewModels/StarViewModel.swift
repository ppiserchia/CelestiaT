//
//  StarViewModel.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 26/02/25.
//

/// The StarViewModel is going to describe deeply how the item we chose(in this case, the "star") looks like, describing it precisely.

import Foundation
import SwiftUI

class Stars: ObservableObject {
    
//   @Published
    
    // These 6 stars 
    
    var starArray: [Star] = [
        Star(starName: "Placeholder",
             starPrompt: Prompt(PromptName: "HR"),
             user: "User1",
             starStory: "Placeholder"),
        
        Star(starName: "Placeholder",
             starPrompt: Prompt(PromptName: "Coming out"), user: "User2",
             starStory: "Placeholder"),
        
        Star(starName: "Placeholder",
             starPrompt: Prompt(PromptName: "Coming out"), user: "User3",
             starStory: "Placeholder"),
        
        Star(starName: "Placeholder",
             starPrompt: Prompt(PromptName: "Coming out"), user: "User4",
             starStory: "Placeholder"),
        
        Star(starName: "Placeholder",
             starPrompt: Prompt(PromptName: "Coming out"), user: "User5",
             starStory: "Placeholder"),
        
        Star(starName: "Placeholder",
             starPrompt: Prompt(PromptName: "Coming out"), user: "User6",
             starStory: "Placeholder")
]
    
}
