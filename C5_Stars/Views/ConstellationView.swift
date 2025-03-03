import SwiftUI

struct ConstellationView: View {
    @State private var stars: [CGPoint] = [] //empty array to store the positions of the stars
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if stars.isEmpty {
                    // Generate random stars when the view appears
                    Color.clear
                        .onAppear {
                            generateRandomStars(in: geometry.size)
                        }
                } else {
                    // Draw connecting lines
                    Path { path in
                        guard let firstPoint = stars.first else { return }
                        path.move(to: firstPoint)
                        for point in stars.dropFirst() {
                            path.addLine(to: point)
                        }
                    }
                    .stroke(Color.blue, lineWidth: 3)
                    
                    // Draw circles
                    ForEach(0..<stars.count, id: \.self) { index in
                        Circle()
                            .fill(randomColor())
                            .frame(width: 30, height: 30)
                            .position(stars[index])
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
    
    private func randomColor() -> Color {
        [Color.red, Color.green, Color.blue, Color.orange, Color.purple].randomElement()!
    }
}

// MARK: - PREVIEW
#Preview {
    ConstellationView()
}
