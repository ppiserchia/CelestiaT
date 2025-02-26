//
//  PromptModel.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 26/02/25.
//

/// The PromtModel will house the different names of the promps that we'll offer across the App

import Foundation
import SwiftUI

struct Prompts: Identifiable {
    var id = UUID()
    var PromptName: String
}
