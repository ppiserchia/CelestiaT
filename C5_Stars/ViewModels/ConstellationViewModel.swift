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
    
    var constellationArray = [
        ConstellationModel(
            constellationName: StarViewModel().rudyConstellation[0].user,
            stars: StarViewModel().rudyConstellation,
            starNumber: StarViewModel().rudyConstellation.count
        ),
        
        ConstellationModel(
            constellationName: StarViewModel().marcoConstellation[0].user,
            stars: StarViewModel().marcoConstellation,
            starNumber: StarViewModel().marcoConstellation.count
        ),
        
        ConstellationModel(
            constellationName: StarViewModel().criFriendConstellation[0].user,
            stars: StarViewModel().criFriendConstellation,
            starNumber: StarViewModel().criFriendConstellation.count
        )
    ]
}
