//
//  NightSkyView.swift
//  C5_Stars
//
//  Created by Luis Mario Recinos Hernández  on 05/03/25.
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
    
    //Changing this variable will change the offset of the center of the sky, allowing the user to navigate through the nightsky
    //We use CGSize to gain access to x and y coordinates instead of a plain value, in this way, offset will lend itself better to control the positions of the assets inside of the view
    @State private var scale: CGFloat = 1.0
    @State private var prevScale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    @State private var prevOffset: CGSize = .zero
    @State private var isZoomedIn: Bool = false //to control the zoom-in of the constellation
    
    var body: some View {
        NavigationStack{
            ZStack{
                GeometryReader { geometry in
                    ZStack {
                        //On the bottom, we'll have the nightSky background, made from a radial gradient of two hues of black
                        RadialGradient(colors: [Color("NightSkyBlackCenter"), Color("NightSkyBlackOuter")], center: .center, startRadius: 30, endRadius: 1000)
                            .frame(width: geometry.size.width * 10, height: geometry.size.height * 10)
                            .ignoresSafeArea()
                        
                        NightSkyViewWithZoom()
                            .frame(width: 400, height: 500)
                            .offset(x: geometry.size.width / 2, y: geometry.size.height / 2)
 
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2) // Centered initially
                    .offset(offset) // Apply drag transformation
                    .scaleEffect(scale) // Apply pinch-to-zoom transformation
                }
                .ignoresSafeArea()
                .gesture(
                    DragGesture(minimumDistance: 10.0, coordinateSpace: .global)
                        .onChanged({ value in
                            self.offset.width = self.prevOffset.width + value.translation.width
                            self.offset.height = self.prevOffset.height + value.translation.height
                        })
                        .onEnded({ value in
                            self.prevOffset = self.offset                    })
                )
                .simultaneousGesture(
                    MagnifyGesture(minimumScaleDelta: 0)
                        .onChanged({ value in
                            self.scale = self.prevScale * value.magnification
                        })
                        .onEnded( { value in
                            self.prevScale = self.scale
                        })        )
    
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            //        .background(.black.opacity(0.8))
            
        }
    }
}


#Preview {
    NightSkyView()
}
