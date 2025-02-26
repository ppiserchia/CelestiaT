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
    
    var stars: [Star] = [
        Star(starName: "Placeholder", starPrompt: Prompts(PromptName: "Therapy"), starStory: "Placeholder"),
        
        Star(starName: "Placeholder", starPrompt: Prompts(PromptName: "Coming out"), starStory: "Placeholder"),
        
        Star(starName: "Placeholder", starPrompt: Prompts(PromptName: "Therapy"), starStory: "Placeholder"),
        
        Star(starName: "Placeholder", starPrompt: Prompts(PromptName: "Sexuality"), starStory: "Placeholder"),
        
        Star(starName: "Placeholder", starPrompt: Prompts(PromptName: "Gender Identity"), starStory: "Placeholder"),
        
        Star(starName: "Placeholder", starPrompt: Prompts(PromptName: "Family"), starStory: "Placeholder")
]
    
}
