//
//  ConstellationView.swift
//  CreateAConstellation
//
//  Created by Gina Saviano on 03/03/25.
//

import SwiftUI
import CoreData

struct ConstellationView: View {
    @StateObject var coreDataVM = CoreDataModelView() //the variable we'll need to call all the methods inside the CoreDataVM
    
    @State private var selectedStar: StarModel? // Tracks selected star
    @EnvironmentObject var starsVM: StarViewModel // EnvironmentObject should be the ViewModel
    @State private var stars: [CGPoint] = [] //empty array to store the positions of the stars
    
    @State var numberOfStars: Int
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                if stars.isEmpty {
                    // Generate random stars when the view appears
                    Color.clear
                        .onAppear {
//                            generateConstellation(in: geometry.size)
                            loadOrGenerateConstellation(in: geometry.size)
                        }
                } else {
                    drawTheConstellation(stars)
                }
            }
        }
    }
    
    //MARK: - CIRCLES' METHODS
//    private func generateConstellation(in size: CGSize) {
//        let unorderedStars = generateStars(in: size)
//        stars = findNearestNeighbor(points: unorderedStars) //Store the ordered version
//    }
    
    //Load or generate stars from CoreData
    func loadOrGenerateConstellation(in size: CGSize) {
        let savedStars = coreDataVM.convertStars()
        
        if !savedStars.isEmpty {
            stars = savedStars// Use stored stars already generated
        } else {
            let unorderedStars = generateStars(in: size)
            stars = findNearestNeighbor(points: unorderedStars)
            coreDataVM.saveStars(stars)
        }
    }
    
    private func generateStars(in size: CGSize) -> [CGPoint] {
        var generatedStars: [CGPoint] = []
        let minDistance: CGFloat = 40

        while generatedStars.count < numberOfStars { //this is where we decide how many stars
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
    
    //Find the Nearest Neighbor with the Nearest Neighbor Algorithm:
    ///this algorithm MINIMIZES the possibilities to have an overlapping but it doesn't prevent it.
    ///this function reorders the given points (stars) by always connecting the nearest unconnected star
    private func findNearestNeighbor(points: [CGPoint]) -> [CGPoint] {
        guard points.count > 1 else { return points } //it checks if there are at least two stars, if there is no star, it breaks
        
        var orderedStars: [CGPoint] = [] //the final ordered constellation, to one to call in the func `generateMultipleConstellations`
        var remainingStars = points //this holds stars that are not connected yet
        var currentPoint = remainingStars.removeFirst() //starts with the first point of the list
        
        orderedStars.append(currentPoint) //it appends the currentPoint to the final array
        
        while !remainingStars.isEmpty { //as long as there are remaining unconnected stars, the function keep adding them
            if let nearestIndexPoint = remainingStars.indices.min(by: { i, j in
                let dist1 = hypot(currentPoint.x - remainingStars[i].x, currentPoint.y - remainingStars[i].y)
                let dist2 = hypot(currentPoint.x - remainingStars[j].x, currentPoint.y - remainingStars[j].y)
                return dist1 < dist2 //all this finds the nearest star by computing the Euclidean distance between two points and then
            }) {
                //update everything
                currentPoint = remainingStars.remove(at: nearestIndexPoint)
                orderedStars.append(currentPoint)
            }
        }
        return orderedStars
    }
}

//DRAW THE CONSTELLATIONS ensuring no overlapping
@ViewBuilder
private func drawTheConstellation( _ stars: [CGPoint]) -> some View {
    Path { path in
        guard let firstPoint = stars.first else { return }
        
        path.move(to: stars.first!)//it needs to start from the first star
        path.addLine(to: firstPoint)
        for point in stars.dropFirst() {
            path.addLine(to: point)
        }
    }
    .stroke(Color.white, lineWidth: 1)
    
    // Draw circles
    ForEach(0..<stars.count, id: \.self) { index in
        Image("star_asset")
            .resizable()
            .scaledToFit()
            .frame(width: randomFrame())
            .position(stars[index])
    }
    
}

// Randomize the frame of the stars to 5 to 25
private func randomFrame() -> CGFloat {
//    return CGFloat.random(in: 5...25)
    return CGFloat.random(in: 5...45)
}

// MARK: - PREVIEW
#Preview {
    ConstellationView(numberOfStars: 5)
}
