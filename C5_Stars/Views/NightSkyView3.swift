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
    
    var dragFeature: some Gesture {
        DragGesture()
            .onChanged { value in
                self.location = value.location
//                self.locationStar = value.location
            }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Sky")
                    .edgesIgnoringSafeArea(.all)
                
                    Text("Hello, World!")
                        .foregroundStyle(.white)
//                        .position(location)
//                        .gesture(dragFeature)
                
                
                Image(systemName: "star.fill")
                    .foregroundStyle(.white)
                    .frame(width: 100, height: 100)
                    .position(location)
                    .gesture(dragFeature)
                
                
            }
            
        }
    }
    
}

#Preview {
    NightSkyView3()
}
