//
//  StarViewModel.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 26/02/25.
//

/// The StarViewModel is going to describe deeply how the item we chose(in this case, the "star") looks like, describing it precisely.

import Foundation
import SwiftUI

@Observable
class StarViewModel: ObservableObject {
    
    // These 6 stars 
    
    var starArray: [StarModel] = [
        StarModel(starName: "Hello1",
             starPrompt: Prompt(PromptName: "HR"),
             user: "User1",
             starStory: "Placeholder"),
        
        StarModel(starName: "Placeholder",
             starPrompt: Prompt(PromptName: "Coming out"),
             user: "User2",
             starStory: "Placeholder"),
        
        StarModel(starName: "Placeholder",
             starPrompt: Prompt(PromptName: "Therapy"),
             user: "User3",
             starStory: "Placeholder"),
        
        StarModel(starName: "Placeholder",
             starPrompt: Prompt(PromptName: "Sexuality"),
             user: "User4",
             starStory: "Placeholder"),
        
        StarModel(starName: "Placeholder",
             starPrompt: Prompt(PromptName: "Friends"),
             user: "User5",
             starStory: "Placeholder"),
        
        StarModel(starName: "Placeholder",
             starPrompt: Prompt(PromptName: "Education"),
             user: "User6",
             starStory: "Placeholder")
]
    }
