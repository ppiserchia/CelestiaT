//
//  NightSkyViewWithZoom.swift
//  C5_Stars
//
//  Created by Gina Saviano on 10/03/25.
//

import SwiftUI

struct NightSkyViewWithZoom: View {
    
    //Changing this variable will change the offset of the center of the sky, allowing the user to navigate through the nightsky
    //We use CGSize to gain access to x and y coordinates instead of a plain value, in this way, offset will lend itself better to control the positions of the assets inside of the view
    @State private var scale: CGFloat = 1.0
    @State private var prevScale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    @State private var prevOffset: CGSize = .zero
    /*
     The Namespace property links two views: this estabilishes the connection between the two views.
     */
    @Namespace private var namespace
    
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
                            ConstellationView()
                                .frame(width: 400, height: 500)       .matchedTransitionSource(id: "zoomTransition", in: namespace)
                        }
                        
                    }
                    .ignoresSafeArea()
                }
            }
        }
    }
}


#Preview {
    NightSkyViewWithZoom()
}
