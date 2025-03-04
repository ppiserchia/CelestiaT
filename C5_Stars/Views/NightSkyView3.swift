//
//  NightSkyView3.swift
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

struct NightSkyView3: View {
    
    @State private var location: CGPoint = CGPoint(x: 50, y: 50) // exact location of the "item" in the view
//    @State private var locationStar: CGPoint = CGPoint(x: 100, y: 100)
    @State private var offset = CGSize.zero
    @State private var lastOffset = CGSize.zero
    
    var dragFeature: some Gesture {
        DragGesture()
            .onChanged { value in
                self.location = value.location
            }
    }
    
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
        
        
            LinearGradient(gradient: Gradient(colors: [.black, .blue]), startPoint: .top, endPoint: .bottom)
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
            .ignoresSafeArea()
//            Color.blue
            
            Image(systemName: "star.fill")
                .foregroundStyle(.white)
                .frame(width: 100, height: 100)
                .position(location)
                .gesture(dragFeature)
        }

            }
                }
        
                
                
           

#Preview {
    NightSkyView3()
}
