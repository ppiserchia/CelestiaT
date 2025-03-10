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
            } label: {
                ZStack{
                    GeometryReader { geometry in
                        ZStack {
                            //On the bottom, we'll have the nightSky background, made from a radial gradient of two hues of black
//                            RadialGradient(colors: [Color("NightSkyBlackCenter"), Color("NightSkyBlackOuter")], center: .center, startRadius: 30, endRadius: 500)
//                                .frame(width: geometry.size.width , height: geometry.size.height)
                            ConstellationView()
                                .frame(width: 400, height: 500)               .matchedTransitionSource(id: "zoomTransition", in: namespace)
                        }
                        
                    }
                    //                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2) // Centered initially
                    //                    .offset(offset) // Apply drag transformation
                    //                    .scaleEffect(scale) // Apply pinch-to-zoom transformation
                    //                }
                    .ignoresSafeArea()
                    //                .gesture(
                    //                    DragGesture(minimumDistance: 10.0, coordinateSpace: .global)
                    //                        .onChanged({ value in
                    //                            self.offset.width = self.prevOffset.width + value.translation.width
                    //                            self.offset.height = self.prevOffset.height + value.translation.height
                    //                        })
                    //                        .onEnded({ value in
                    //                            self.prevOffset = self.offset                    })
                    //                )
                    //                .simultaneousGesture(
                    //                    MagnifyGesture(minimumScaleDelta: 0)
                    //                        .onChanged({ value in
                    //                            self.scale = self.prevScale * value.magnification
                    //                        })
                    //                        .onEnded( { value in
                    //                            self.prevScale = self.scale
                    //                        })        )
                    //
                    //            }
                    //            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    //        .background(.black.opacity(0.8))
                    
                }
            }
        }
    }
}


#Preview {
    NightSkyViewWithZoom()
}
