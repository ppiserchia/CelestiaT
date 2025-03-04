//
//  MultipleConstellationsView.swift
//  C5_Stars
//
//  Created by Gina Saviano on 04/03/25.
//

import SwiftUI

struct MultipleConstellationsView: View {
    @State private var firstMultipleConstellations: [[CGPoint]] = [] //an empty array of arrays to store multiple constellations
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.ignoresSafeArea()
                
                if firstMultipleConstellations.isEmpty {
                    Color.clear
                        .onAppear{
                            generateMultipleConstellations(in: geometry.size, count: 5) // render 3 constellations
                        }
                } else {
                    ForEach(0..<firstMultipleConstellations.count, id: \.self) { index in
                        drawTheConstellation(firstMultipleConstellations[index])
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
            
            newConstellations.append(stars)
        }
        firstMultipleConstellations = newConstellations
    }
    
    //DRAW THE CONSTELLATIONS
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
    MultipleConstellationsView()
}
