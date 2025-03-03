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
            let imageWidth = screenWidth * 2 // Make image larger than screen
            let imageHeight = screenHeight * 2
            let minX = -imageWidth + screenWidth
            let maxX: CGFloat = 0
            let minY = -imageHeight + screenHeight
            let maxY: CGFloat = 0

            
            
            
            
            // Color or image that are shown in the view
            
            ZStack {
                Image("Sky")
                .resizable()
                .ignoresSafeArea(edges: .all)
                .scaledToFill()
                .frame(width: geometry.size.width * 2, height: geometry.size.height * 2) // we're making the photo larger
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
                
        }
            VStack {
                Text("hey")
                Text("hola")
                
                
                
            }
    }
}
}

    
    

    
    
    
    
//    var body: some View {
//        ScrollView() {
//            Image(systemName: "rectangle")
//                .padding(.horizontal)
//            Image(systemName: "rectangle")
//                .padding()
//            Image(systemName: "rectangle")
//                .padding()
//            Image(systemName: "rectangle")
//                .padding()
//
//        }
//    }


#Preview {
    NightSkyView2()
}
