//
//  PromptViewModel.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 26/02/25.
//

/// In PromptViewModel we assign to each prompt a name.
/// Prompts will be an array of differents prompts.

import Foundation
import SwiftUI

class ListofPrompt: ObservableObject {
    
//    @Published
    var prompts: [Prompt] = [
        Prompt(PromptName: "HR"),
        Prompt(PromptName: "Coming out"),
        Prompt(PromptName: "Therapy"),
        Prompt(PromptName: "Sexuality"),
        Prompt(PromptName: "Gender Identity"),
        Prompt(PromptName: "Family"),
        Prompt(PromptName: "Work"),
        Prompt(PromptName: "Friends"),
        Prompt(PromptName: "Love life"),
        Prompt(PromptName: "Shopping"),
        Prompt(PromptName: "Media representation"),
        Prompt(PromptName: "Clubbing"),
        Prompt(PromptName: "Trans community"),
        Prompt(PromptName: "Surgery"),
        Prompt(PromptName: "Body dysmorphia"),
        Prompt(PromptName: "ID Change"),
        Prompt(PromptName: "Religion"),
        Prompt(PromptName: "Activism"),
        Prompt(PromptName: "Gender euphoria"),
        Prompt(PromptName: "Education")
    ]
}
