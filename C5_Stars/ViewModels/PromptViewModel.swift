//
//  PromptViewModel.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 26/02/25.
//

///PromptViewModel will have the array of the different prompts, with their names

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
        Prompts(PromptName: "Love life")
    ]
}
