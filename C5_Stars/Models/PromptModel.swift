//
//  PromptModel.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 26/02/25.
//

/// The PromtModel will house the different names of the promps that we'll offer across the App

import Foundation
import SwiftUI

//How to make a string inside of the code localizable?
//Even thought SwiftUI automatically detects the Text View as a localizable asset to be translated, som other strings, like the ones present in a DataModel won't recieve this automatic treatment, in order to include this Strings into the Localizable folder (the principal tool for translating text inside of the App) we need to:
//  1.- Camiar el tipo de dato de Sting a LocalizedStringKey

struct Prompt: Identifiable {
    var id = UUID()
    var PromptName: LocalizedStringKey
}
