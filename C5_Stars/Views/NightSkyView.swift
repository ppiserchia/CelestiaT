//
//  NightSkyView.swift
//  C5_Stars
//
//  Created by Luis Mario Recinos Hernández  on 28/02/25.
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

struct NightSkyView: View {
    
    @State private var location: CGPoint = CGPoint(x: 50, y: 50) // exact location of the "item" in the view
    
    @State private var offset = CGSize.zero
    @State private var lastOffset = CGSize.zero
    
   
    var body: some View {
        
        // Describe the geometric position in the view of each item
        
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height
            let imageWidth = screenWidth * 2 // Make the image larger than screen, in terms of width
            let imageHeight = screenHeight * 2 // Make the
            let minX = -imageWidth + screenWidth
            let maxX: CGFloat = 0
            let minY = -imageHeight + screenHeight
            let maxY: CGFloat = 0

            
            // Color or image that are shown
            
            ZStack {
                Color.gray
                    .ignoresSafeArea()
//                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width * 150, height: geometry.size.height * 150) // we're making the photo larger
                .offset(x: offset.width, y: offset.height)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            var newWidth = lastOffset.width + gesture.translation.width
                            var newHeight = lastOffset.height + gesture.translation.height

            // Constrain movement within bounds
                            newWidth = min(max(newWidth, minX), maxX)
                         newHeight = min(max(newHeight, minY), maxY)

                        offset = CGSize(width: newWidth, height: newHeight)
                            
                            
                            
                            
                            offset = CGSize(
                                width: lastOffset.width + gesture.translation.width,
                                height: lastOffset.height + gesture.translation.height
                            )
                        }
                        .onEnded { _ in
                            lastOffset = offset
                        }
                )
                
                Text("hey")
        }
    }
}
}
//        Image(systemName: "star.fill")
//            .foregroundStyle(.blue)
//            .frame(width: 100, height: 100)
//            .position(location)
//            .gesture(dragFeature)
//    
//    
//    var dragFeature: some Gesture {
//        DragGesture()
//            .onChanged { value in
//                self.location = value.location
//            }
//    }
    
    
   
#Preview {
    NightSkyView()
}
