//
//  PersistenceManager.swift
//  C5_Stars
//
//  Created by Trae AI on 13/03/25.
//

import Foundation
import SwiftUI

// This struct will be used to encode/decode constellation data
struct ConstellationData: Codable {
    let name: String
    let numberOfStars: Int
    let starPositions: [StarPosition]
    
    struct StarPosition: Codable {
        let x: Double
        let y: Double
    }
}

class PersistenceManager {
    static let shared = PersistenceManager()
    
    private let userDefaults = UserDefaults.standard
    private let constellationsKey = "savedConstellations"
    
    private init() {}
    
    // Save constellation data to UserDefaults
    func saveConstellation(name: String, numberOfStars: Int, stars: [CGPoint]) {
        // Convert CGPoint array to StarPosition array for encoding
        let starPositions = stars.map { ConstellationData.StarPosition(x: Double($0.x), y: Double($0.y)) }
        
        // Create constellation data object
        let constellationData = ConstellationData(
            name: name,
            numberOfStars: numberOfStars,
            starPositions: starPositions
        )
        
        // Get existing constellations or create empty array
        var savedConstellations = getConstellationsData()
        
        // Remove existing constellation with same name if it exists
        savedConstellations.removeAll { $0.name == name }
        
        // Add new constellation data
        savedConstellations.append(constellationData)
        
        // Save updated array back to UserDefaults
        if let encodedData = try? JSONEncoder().encode(savedConstellations) {
            userDefaults.set(encodedData, forKey: constellationsKey)
            userDefaults.synchronize() // Force synchronization to ensure data persists
        }
    }
    
    // Get all saved constellations
    func getConstellationsData() -> [ConstellationData] {
        guard let data = userDefaults.data(forKey: constellationsKey),
              let constellations = try? JSONDecoder().decode([ConstellationData].self, from: data) else {
            return []
        }
        return constellations
    }
    
    // Get a specific constellation by name
    func getConstellation(name: String) -> ConstellationData? {
        return getConstellationsData().first { $0.name == name }
    }
    
    // Convert ConstellationData to CGPoint array
    func convertToCGPoints(constellation: ConstellationData) -> [CGPoint] {
        return constellation.starPositions.map { CGPoint(x: $0.x, y: $0.y) }
    }
    
    // Delete a constellation by name
    func deleteConstellation(name: String) {
        var savedConstellations = getConstellationsData()
        savedConstellations.removeAll { $0.name == name }
        
        if let encodedData = try? JSONEncoder().encode(savedConstellations) {
            userDefaults.set(encodedData, forKey: constellationsKey)
            userDefaults.synchronize() // Force synchronization to ensure data persists
        }
    }
    
    // Clear all saved constellations
    func clearAllConstellations() {
        userDefaults.removeObject(forKey: constellationsKey)
        userDefaults.synchronize() // Force synchronization to ensure data persists
    }
}