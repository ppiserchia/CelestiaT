//
//  CoreDataModelView.swift
//  C5_Stars
//
//  Created by Gina Saviano on 13/03/25.
//

import CoreData
import UIKit

class CoreDataModelView: ObservableObject {
    //the persisten container we'll call to access the contents inside the model
    let persistentContainer: NSPersistentContainer
    @Published var savedStarEntities: [StarEntity] = [] //where we're gonna save our fetch request
    
    @Published var savedConstellationEntities: [ConstellationEntity] = []//we need to create a container for the constellation, an array of arrays, each array ends when the number of the stars of each constellation is met
    
    init() {
        persistentContainer = NSPersistentContainer(name: "StarsContainer")
        
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                print ("ERROR LOADING CORE DATA MODEL: \(error)")
            } else {
                print ("Core Data successfully loaded!")
            }
        }
        fetchStar()
        fetchConstellation()
    }
    
    //MARK: - START OF STAR METHODS
    
    func fetchStar() {
        let request = NSFetchRequest<StarEntity>(entityName: "StarEntity")
        
        do {
            savedStarEntities = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print ("Error fetching data of stars: \(error)")
        }
    }
    
    func saveStars(_ stars: [CGPoint]) {
        let context = persistentContainer.viewContext
        
        for star in stars {
            let newStar = StarEntity(context: context)
            newStar.x = Double(star.x)
            newStar.y = Double(star.y)
        }
        
        do {
            try context.save()
            fetchStar()
        } catch let error {
            print ("Error saving data: \(error)")
        }
    }
    
    //We need to convert Fetched Entites (because they're Double) into CGPoint
    func convertStars() -> [CGPoint] {
        return savedStarEntities.map { CGPoint(x: CGFloat($0.x), y: CGFloat($0.y)) }
    }
    
    //MARK: - END OF STAR METHODS
    
    //MARK: - START OF CONSTELLATION METHOD
    func fetchConstellation() {
        let request = NSFetchRequest<ConstellationEntity>(entityName: "ConstellationEntity")
        
        do {
            savedConstellationEntities = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching data of constellation: \(error)")
        }
    }
    
    func saveConstellationsFromViewModel(viewModel: ConstellationViewModel) {
        let context = persistentContainer.viewContext
        
        //For-loop that creates a constellation for each constellation in the VM
        for constellation in viewModel.constellationArray {
            let newConstellation = ConstellationEntity(context: context)
            newConstellation.name = constellation.constellationName
            newConstellation.numberOfStars = Int16(constellation.stars.count)
            
            // Generate random positions for stars in the constellation
            let size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            let starPositions = generateStars(count: constellation.stars.count, in: size)
            
            // Save stars using the generated positions
            saveStars(starPositions)
            
            // Associate the newly created stars with the constellation
            let lastStarIndex = savedStarEntities.count - constellation.stars.count
            for i in 0..<constellation.stars.count {
                if lastStarIndex + i < savedStarEntities.count {
                    savedStarEntities[lastStarIndex + i].constellationRel = newConstellation
                }
            }
        }
        
        do {
            try context.save()
            fetchStar()
            fetchConstellation()
        } catch let error {
            print ("Error saving constellation data: \(error)")
        }
    }
    
    //MARK: - END OF CONSTELLATION METHODS
    
    // Helper function to generate random star positions
    private func generateStars(count: Int, in size: CGSize) -> [CGPoint] {
        var generatedStars: [CGPoint] = []
        let minDistance: CGFloat = 40

        while generatedStars.count < count {
            let newPoint = CGPoint(
                x: CGFloat.random(in: 50...(size.width - 50)),
                y: CGFloat.random(in: 50...(size.height - 50))
            )
            
            let isTooClose = generatedStars.contains { existing in
                hypot(existing.x - newPoint.x , existing.y - newPoint.y) < minDistance
            }
            
            if !isTooClose {
                generatedStars.append(newPoint)
            }
        }
        return generatedStars
    }
}
