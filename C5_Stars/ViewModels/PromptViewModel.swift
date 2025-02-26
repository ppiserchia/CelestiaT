//
//  PromptViewModel.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 26/02/25.
//

import Foundation
import SwiftUI

class Prompt: ObservableObject {
    
//    @Published
    var prompts: [Prompts] = [
        Prompts(PromptName: "HR"),
        Prompts(PromptName: "Coming out"),
        Prompts(PromptName: "Therapy"),
        Prompts(PromptName: "Sexuality"),
        Prompts(PromptName: "Gender Identity"),
        Prompts(PromptName: "Family"),
        Prompts(PromptName: "Work"),
        Prompts(PromptName: "Friends"),
        Prompts(PromptName: "Love life"),
        Prompts(PromptName: "Shopping"),
        Prompts(PromptName: "Media representation"),
        Prompts(PromptName: "Clubbing"),
        Prompts(PromptName: "Trans community"),
        Prompts(PromptName: "Surgery"),
        Prompts(PromptName: "Body dysmorphia"),
        Prompts(PromptName: "ID Change"),
        Prompts(PromptName: "Religion"),
        Prompts(PromptName: "Activism"),
        Prompts(PromptName: "Gender euphoria"),
        Prompts(PromptName: "Education")
        
    ]
}
