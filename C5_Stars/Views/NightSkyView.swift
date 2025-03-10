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
                        
                        ConstellationView()
<<<<<<< HEAD
                            .frame(width: 400, height: 500)
                            .offset(x: geometry.size.width / 2, y: geometry.size.height / 2)
                        
=======
                            .frame(width: 500, height: 500)
                            .offset(
                                x: isZoomedIn ? 0 : geometry.size.width / 2,
                                y: isZoomedIn ? 0 : geometry.size.height / 2
                            )
                            .scaleEffect(isZoomedIn ? 2.5 : 1.0)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.75)) {
                                    isZoomedIn.toggle()
                                }
                            }
>>>>>>> gina
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2) // Centered initially
                    .offset(isZoomedIn ? .zero : offset) // Apply drag transformation
                }
                .ignoresSafeArea()
                .gesture(
                    DragGesture(minimumDistance: 20.0, coordinateSpace: .global)
                        .onChanged{ value in
                            if !isZoomedIn {
                                self.offset.width = self.prevOffset.width + value.translation.width
                                self.offset.height = self.prevOffset.height + value.translation.height
                            }
                            
                        }
                        .onEnded({ _ in
                            self.prevOffset = self.offset                    })
                )

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            //        .background(.black.opacity(0.8))
            
        }
    }
}


#Preview {
    NightSkyView()
}
