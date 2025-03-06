//
//  MultipleConstellationView.swift
//  CreateAConstellation
//
//  Created by Gina Saviano on 03/03/25.
//

import SwiftUI

struct MultipleConstellationView: View {
    @State private var firstMultipleConstellations: [[CGPoint]] = [] //an empty array of arrays to store multiple constellations
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.ignoresSafeArea()
                
                if firstMultipleConstellations.isEmpty {
                    Color.clear
                        .onAppear{
                            generateMultipleConstellations(in: geometry.size, count: 2) // render 3 constellations
                        }
                } else {
                    ForEach(firstMultipleConstellations.indices, id: \.self) { index in
                        drawTheConstellation(firstMultipleConstellations[index])
                        
                        NavigationLink {
                            StarDetailView()
                        } label: {
                            Rectangle()
                                .opacity(0)
                        }
                    }

                }
            }
        }
    }
    
    //MARK: - FUNCTIONS
    
    //GENERATE MULTIPLE CONSTELLATIONS
    private func generateMultipleConstellations(in size: CGSize, count: Int, starCount: Int = 5, minDistance: CGFloat = 40) { //the `minDistance` is arbitrary
        var newConstellations: [[CGPoint]] = [] //this array is needed to store the new constellations generated and it will update the array `firstMultipleConstellations`
        
        //To prevent the constellations to overlap let's try to divide the screen into grids
        let columns = Int(sqrt(Double(count))) //the number of the columns
        ///`count` represents the number of constellations made. It is decided with the parameter of the func `generateMultipleCOnstellations`. Then it is converted in a Double to perform the square root of the number
        let rows = (count + columns - 1) / columns //the number of the rows based on the columns
        let regionWidth = size.width / CGFloat(columns)
        let regionHeight = size.height / CGFloat(rows)
        ///these above is to have an equal space for each constellation
        
        ///This `for while` loop generates different constellation candidates and check if they are distant from the previous constellations
        for i in 0..<count {
            var stars: [CGPoint] = []
            var attempts = 0
            
            ///Here we will determine th bounderies for each constellation
            let colBox = i % columns
            let rowBox = i / columns
            let xStart = CGFloat(colBox) * regionWidth
            let yStart = CGFloat(rowBox) * regionHeight
            
            
            while stars.count < starCount && attempts < 1000 { //this should prevent the function to be stuck in a loop of attempts
                
                let candidate = CGPoint(
                    x: CGFloat.random(in: xStart + 30...(xStart + regionWidth - 30)),
                    y: CGFloat.random(in: yStart + 30...(yStart + regionHeight - 30))
                )
                
                
                //Now let's check if the `var candidate` is far enough
                let isFarEnough = stars.allSatisfy { existing in
                    let dx = candidate.x - existing.x
                    let dy = candidate.y - existing.y
                    let distance = sqrt(dx * dx + dy * dy)
                    return distance >= minDistance
                }
                
                if isFarEnough {
                    stars.append(candidate)
                }
                
                attempts += 1
                
            }
            
            //Use the Nearest Neighbor Algorithm to order stars
            let orderedStars = findNearestNeighbor(points: stars)
            
            newConstellations.append(orderedStars)
        }
        firstMultipleConstellations = newConstellations
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
    
    
    //DRAW THE CONSTELLATIONS ensuring no overlapping
    @ViewBuilder
    private func drawTheConstellation( _ stars: [CGPoint]) -> some View {
        Path { path in
            guard let firstPoint = stars.first else { return }
            path.move(to: firstPoint)
            for point in stars.dropFirst() {
                path.addLine(to: point)
            }
        }
        .stroke(Color.white, lineWidth: 1)
        
        // Draw circles
        ForEach(0..<stars.count, id: \.self) { index in
            Circle()
                .fill(.white)
                .frame(width: 20, height: 20)
                .position(stars[index])
        }
        
        
    }
}



//MARK: - PREVIEW
#Preview {
    MultipleConstellationView()
}
