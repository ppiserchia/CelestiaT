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
        
        //MARK: Describe the geometric position in the view of each item
        
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height
            let imageWidth = screenWidth * 2
            let imageHeight = screenHeight * 2
            let minX = -imageWidth + screenWidth
            let maxX: CGFloat = 0
            let minY = -imageHeight + screenHeight
            let maxY: CGFloat = 0
            
            
            //MARK: image that is shown
            
            Image("Sky")
            //  LinearGradient(gradient: Gradient(colors: [.black, .black]), startPoint: .top, endPoint: .topLeading)
            //                    .ignoresSafeArea()
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width * 3, height: geometry.size.height * 3) // we're making the photo larger
                .ignoresSafeArea(edges: .all)
            
            //                .frame(width: geometry.size.width * 150, height: geometry.size.height * 150)
            // this amount of width and height is used for colors, in order to have a large background.
            
                .offset(x: offset.width, y: offset.height) // the offset amount is calculated based on the var offset declared above.
            
            //MARK: now we're declaring the gesture of moving the background.
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            var newWidth = lastOffset.width + gesture.translation.width
                            var newHeight = lastOffset.height + gesture.translation.height
                            
                            // Constrain movement within bounds: with the variables newWidth and newHeight, the image doesn't go outside, displaying a white space
                            
                            newWidth = min(max(newWidth, minX), maxX)
                            newHeight = min(max(newHeight, minY), maxY)
                            
                            offset = CGSize(width: newWidth, height: newHeight)
                        }
                        .onEnded { _ in
                            lastOffset = offset
                        }
                )
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
