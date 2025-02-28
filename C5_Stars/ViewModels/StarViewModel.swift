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
    
   @Published
    
    // These 6 stars represent the 6 stories that we are going to show, for now.
    
    var stars: [Star] = [
        Star(starName: "Star1",
             starPrompt:
                Prompt(PromptName: "Therapy"),
             user: "myName",
             starStory: "Placeholder")
        ,
        
        Star(starName: "Star2",
             starPrompt:
                Prompt(PromptName: "HR"),
             user: "myName2",
             starStory: "Placeholder"),
        
        Star(starName: "Star3",
             starPrompt:
                Prompt(PromptName: "Therapy"),
             user: "myName3",
             starStory: "Placeholder"),
        
        Star(starName: "Star4",
             starPrompt:
                Prompt(PromptName: "Therapy"),
             user: "myName4",
             starStory: "Placeholder"),
        
        Star(starName: "Star5",
             starPrompt:
                Prompt(PromptName: "Therapy"),
             user: "myName5",
             starStory: "Placeholder"),
        
        Star(starName: "Star6",
             starPrompt:
                Prompt(PromptName: "Therapy"),
             user: "myName6",
             starStory: "Placeholder")
        
]

}
