//
//  NightSkyViewWithZoom.swift
//  C5_Stars
//
//  Created by Gina Saviano on 10/03/25.
//

import SwiftUI

struct NightSkyViewWithZoom: View {
    /*
     The Namespace property links two views: this estabilishes the connection between the two views.
     */
    @Namespace private var namespace
    
    var numberOfStarsNightZoom: Int
    
    var body: some View {
        NavigationStack{
            //here is where we're supposed to insert the navigation link
            NavigationLink {
                //here is the DestinationView
                DetailConstellationView()
                    .navigationTransition(.zoom(sourceID: "zoomTransition", in: namespace))
                //                    .navigationBarBackButtonHidden(true)
            } label: {
                ZStack{
                    GeometryReader { geometry in
                        ZStack {
                            ConstellationView(numberOfStars: numberOfStarsNightZoom)
                                .frame(width: 400, height: 500)               .matchedTransitionSource(id: "zoomTransition", in: namespace)
                        }
                        
                    }
                    .ignoresSafeArea()
                }
            }
        }
    }
}


#Preview {
    NightSkyViewWithZoom(numberOfStarsNightZoom: 5)
}
