//
//  CoreDataModelView.swift
//  C5_Stars
//
//  Created by Gina Saviano on 13/03/25.
//

import CoreData

class CoreDataModelView: ObservableObject {
    //the persisten container we'll call to access the contents inside the model
    let persistentContainer: NSPersistentContainer
    @Published var savedEntities: [StarEntity] = [] //where we're gonna save our fetch request
    
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
    }
    
    
    func fetchStar() {
        let request = NSFetchRequest<StarEntity>(entityName: "StarEntity")
        
        do {
            savedEntities = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print ("Error fetching data: \(error)")
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
        return savedEntities.map { CGPoint(x: CGFloat($0.x), y: CGFloat($0.y)) }
    }
}
