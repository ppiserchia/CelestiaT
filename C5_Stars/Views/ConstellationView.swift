import SwiftUI

struct ConstellationView: View {
    @State private var stars: [CGPoint] = [] //empty array to store the positions of the stars
    @State var changeToDetailView = false
    
    
    var body: some View {
        
        
        GeometryReader { geometry in
            
            NavigationStack{
                ZStack {
                    LinearGradient(
                        colors: [.black.opacity(0.8), .black],
                        startPoint: .bottom,
                        endPoint: .top)
                    .ignoresSafeArea()
                    
                    if stars.isEmpty {
                        // Generate random stars when the view appears
                        Color.clear
                            .onAppear {
                                generateRandomStars(in: geometry.size)
                            }
                    } else {
                        // Draw connecting lines
                        ///PATH is a SwiftUI component that allows to define a custom shape by drawing lines, curves and other graphical element
                        ///Inside the closures  `{ path in }` we define how this graphical element should be rendered
                        Path { path in
                            guard let firstPoint = stars.first else { return }
                            /// here we are ensuring there's a first point where to draw the line: in this case, the first point is the first star of the array "stars".
                            /// the `guard let` ensures that there is at least one point, otherwise it exits with `return`
                            path.move(to: firstPoint) //the "drawing cursor" is moved to the first point we declared before
                            for point in stars.dropFirst() {
                                path.addLine(to: point)
                            }
                            ///here we are connecting the remaning points: `stars.dropFirst()` is a function that gives back all the elements of the array but the first, so we can iterate on the array and connect all the stars
                        }
                        .stroke(Color.white, lineWidth: 3)
                        
                        // Draw circles
                        ForEach(0..<stars.count, id: \.self) { index in
                            Circle()
                                .fill(Color.white)
                                .frame(width: 30, height: 30)
                                .position(stars[index])
                        }
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
    private func generateRandomStars(in size: CGSize) {
        stars = (0..<5).map { _ in
            CGPoint(
                x: CGFloat.random(in: 50...(size.width - 50)),
                y: CGFloat.random(in: 50...(size.height - 50))
            )
        }
    }
}

// MARK: - PREVIEW
#Preview {
    ConstellationView()
}
