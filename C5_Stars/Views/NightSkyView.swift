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
    @State private var offset = CGSize.zero
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                //On the bottom, we'll have the nightSky background, made from a radial gradient of two hues of black
                RadialGradient(colors: [Color("NightSkyBlackCenter"), Color("NightSkyBlackOuter")], center: .center, startRadius: 30, endRadius: 1000)
                    .frame(width: 5000, height: 5000)
                
                Text("Ancher")
                    .foregroundColor(.white)
                    .font(.system(size: 50, weight: .bold))
                
                
            }
            .frame(width: geometry.size.width * 2, height: geometry.size.height * 2)
            .offset(x: offset.width , y: offset.height)
            //This might be useful to zoom in to the elected constellation
            .scaleEffect(scale)
            //Whenever the user scrolls, the offset will be actually modified inside of the code
            .gesture(
                DragGesture()
                    .onChanged { value in
                        offset.width += value.translation.width/14
                        offset.height += value.translation.height/14
                    }
            )
            
            //ConstellationView()
            
            
            
        }
    }
}

#Preview {
    NightSkyView()
}
