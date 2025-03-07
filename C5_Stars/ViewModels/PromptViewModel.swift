//
//  PromptViewModel.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 26/02/25.
//

///PromptViewModel will have the array of the different prompts, with their names

import Foundation
import SwiftUI

class PromptViewModel: ObservableObject {
    
//    @Published
    var promptArray: [Prompt] = [
        Prompt(PromptName: "HTR"),
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
