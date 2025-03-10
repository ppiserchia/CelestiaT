//
//  ConstellationModel.swift
//  C5_Stars
//
//  Created by Luis Mario Recinos Hernández  on 26/02/25.
//

///Constellations will host an array of different stars, each realted to a story written for a specific prompt
///Constellations will be explorable inside of the home view

import Foundation

struct ConstellationModel: Identifiable {
    var id = UUID()
    var constellationName: String
    //Empty array of stars
    var stars: [StarModel]
    var starNumber: Int
}
