//
//  PromptModel.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 26/02/25.
//

/// PromptModel describes which property a Prompt could have. In this case, our prompts have only its name as a property.


import Foundation
import SwiftUI

struct Prompt: Identifiable {
    var id = UUID()
    var PromptName: String
}
