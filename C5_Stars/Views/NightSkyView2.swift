//
//  NightSkyView2.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 03/03/25.
//

///This will be the landing view after opening the App, in it, the nightsky will be displayed as a scrollable space where to
///
///     • Create your own constellation
///
///     • See your own constellation
///
///     • Find new constellations
///
///     In this ScrollView, we can move the items indicated below anywhere, but they will return at the center.
///     Our aim is to move the items anywhere, and they don't have to return at the center.

import SwiftUI

struct NightSkyView2: View {
    
    @State private var location: CGPoint = CGPoint(x: 50, y: 50) // exact location of the "item" in the view
    
    @State private var offset = CGSize.zero
    @State private var lastOffset = CGSize.zero
    
   
    var body: some View {
        
        GeometryReader { geometry in
            
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height
            let backgroundWidth = screenWidth * 2 // Make it larger than the screen
            let backgroundHeight = screenHeight * 2
            
            let minX = -backgroundWidth + screenWidth
            let maxX: CGFloat = 0
            let minY = -backgroundHeight + screenHeight
            let maxY: CGFloat = 0
            

            //MARK: Color or image that is shown in the view
            
//            Color.black
            LinearGradient(gradient: Gradient(colors: [.black, .gray]), startPoint: .top, endPoint: .bottom)
                .frame(width: backgroundWidth, height: backgroundHeight)
                .offset(x: offset.width, y: offset.height)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            var newWidth = lastOffset.width + gesture.translation.width
                            var newHeight = lastOffset.height + gesture.translation.height
                            
                            newWidth = min(max(newWidth, minX), maxX)
                            newHeight = min(max(newHeight, minY), maxY)
                            
                            offset = CGSize(width: newWidth, height: newHeight)
                        }
                        .onEnded { _ in
                            lastOffset = offset
                        }
                )
        }
        .edgesIgnoringSafeArea(.all)
        
    VStack {
            Text("Hello, World!")
            .font(.largeTitle)
            .multilineTextAlignment(.center)
                }
        
    }
}

#Preview {
    NightSkyView2()
}
