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
    
    var promptArray: [Prompt] = [
        Prompt(PromptName: "HTR"),
        Prompt(PromptName: "Coming out"),
        Prompt(PromptName: "Pshycological Therapy"),
        Prompt(PromptName: "Sexuality"),
        Prompt(PromptName: "Gender Identity"),
        Prompt(PromptName: "Family"),
        Prompt(PromptName: "Work"),
        Prompt(PromptName: "Friends"),
        Prompt(PromptName: "Love Life"),
        Prompt(PromptName: "Shopping"),
        Prompt(PromptName: "Media Representation"),
        Prompt(PromptName: "Clubbing"),
        Prompt(PromptName: "Trans Community"),
        Prompt(PromptName: "Surgery"),
        Prompt(PromptName: "Body Dysmorphia"),
        Prompt(PromptName: "ID Change"),
        Prompt(PromptName: "Religion"),
        Prompt(PromptName: "Activism"),
        Prompt(PromptName: "Gender Euphoria"),
        Prompt(PromptName: "Education")
        
    ]
}
