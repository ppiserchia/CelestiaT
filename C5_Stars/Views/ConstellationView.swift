import SwiftUI

struct ConstellationView: View {
    @State private var selectedStar: StarModel? // Tracks selected star
    @EnvironmentObject var starsVM: StarViewModel // EnvironmentObject should be the ViewModel
    @State private var stars: [CGPoint] = [] //empty array to store the positions of the stars
    
    var body: some View {
        GeometryReader { geometry in
            
            NavigationStack{
                ZStack {   
                    if stars.isEmpty {
                        // Generate random stars when the view appears
                        Color.clear
                            .onAppear {
                                generateConstellation(in: geometry.size)
                            }
                    } else {
//                        // Draw connecting lines
//                        ///PATH is a SwiftUI component that allows to define a custom shape by drawing lines, curves and other graphical element
//                        ///Inside the closures  `{ path in }` we define how this graphical element should be rendered
//                        Path { path in
//                            guard let firstPoint = stars.first else { return }
//                            /// here we are ensuring there's a first point where to draw the line: in this case, the first point is the first star of the array "stars".
//                            /// the `guard let` ensures that there is at least one point, otherwise it exits with `return`
//                            path.move(to: firstPoint) //the "drawing cursor" is moved to the first point we declared before
//                            for point in stars.dropFirst() {
//                                path.addLine(to: point)
//                            }
//                            ///here we are connecting the remaning points: `stars.dropFirst()` is a function that gives back all the elements of the array but the first, so we can iterate on the array and connect all the stars
//                        }
//                        .stroke(Color.white, lineWidth: 3)
                        
                        
                        // Draw circles
//                        ForEach(0..<stars.count, id: \.self) { index in
//                            Circle()
//                                .fill(Color.white)
//                                .frame(width: 30, height: 30)
//                                .position(stars[index])
//                        }
                        
                        drawTheConstellation(stars)
                    }
                    NavigationLink {
                        ConstellationDetailView()
                    } label: {
                        Rectangle()
                            .opacity(0)
                    }
                }
            }
        }
    }
    
    //MARK: - CIRCLES' METHODS
    private func generateConstellation(in size: CGSize) {
        stars = generateRandomStars(in: size)
        stars = findNearestNeighbor(points: stars)
    }
    
    private func generateRandomStars(in size: CGSize) -> [CGPoint] {
        var generatedStars: [CGPoint] = []
        let minDistance: CGFloat = 40
        
        while generatedStars.count < 5 { //this is where we decide how many stars
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
        guard stars.count > 1 else { return }
        
        path.move(to: stars.first!)//it needs to start from the first star
        
        for i in 1..<stars.count {
            let previous = stars[i - 1]
            let current = stars[i]
            
            //Add an offset variable to make the curve more exaggerated
            let offset: CGFloat = 30
            
            //Draw the mid point in a way that they're kind of dynamic
            let controlX = (previous.x + current.x) / 2
            let controlY = (previous.y + current.y) / 2 + ((i % 2 == 0) ? offset : -offset)
            
            let controlPoint = CGPoint(x: controlX, y: controlY)
            
            path.addQuadCurve(to: current, control: controlPoint)
            
        }
            //Let's calculate the middle points between two stars in order to create the curve
//            let mid1 = CGPoint(x: (previous.x + current.x) / 2, y: previous.y)
//            let mid2 = CGPoint(x: (previous.x + current.x) / 2, y: current.y)
            
            
            // Control point: Midpoint between previous and current
            //                       let controlPoint = CGPoint(
            //                           x: (previous.x + current.x) / 2,
            //                           y: (previous.y + current.y) / 2
            //                       )
            
            //Let's draw the curve
//            path.addCurve(to: current, control1: mid1, control2: mid2)
//        }
            
//            path.addArc(tangent1End: mid1, tangent2End: mid2, radius: 10)
            
//            path.addQuadCurve(to: current, control: controlPoint)
//        }
    }
    .stroke(Color.white, lineWidth: 1)
    
    // Draw circles
    ForEach(0..<stars.count, id: \.self) { index in
        Circle()
            .fill(.white)
            .frame(width: 15, height: 15)
            .position(stars[index])
    }
    
}

// MARK: - PREVIEW
#Preview {
    ZStack{
        ConstellationView()
    }
}
