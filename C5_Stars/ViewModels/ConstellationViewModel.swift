//
//  ConstellationViewModel.swift
//  C5_Stars
//
//  Created by Luis Mario Recinos Hernández  on 10/03/25.
//

import Foundation
import SwiftUI

@Observable

class ConstellationViewModel: ObservableObject {
    
    var constellationArray: [ConstellationModel] = [
        ConstellationModel(constellationName: "Creative Beaver", stars: StarViewModel().rudyConstellation, starNumber: 3)
    ]
}
