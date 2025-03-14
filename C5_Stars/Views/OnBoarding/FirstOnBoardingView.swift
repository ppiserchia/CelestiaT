//
//  FirstOnBoardingView.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 12/03/25.
//

import SwiftUI

struct FirstOnBoardingView: View {
    
    var body: some View {
        
        //MARK: Setting up the animated mesh gradient:
        
        /// Define the geometrical coordinates
        TimelineView(.animation) { timeline in
            let x = (sin(timeline.date.timeIntervalSince1970) + 1) / 2
            
            NavigationStack {
                ZStack {
                    //MARK: Set up the values: width, heights and points.
                    MeshGradient(width: 3, height: 3, points: [
                        [0, 0], [0.5, 0], [1, 0],
                        [0, 0.5], [0.5, Float(x)], [1, 0.5],
                        [0, 1], [0.5, 1], [1, 1]
                        
                        /// Set up the colors
                    ], colors: [
                        .black, .black, .black,
                        .gray, .black, .gray,
                        .black, .black, .black
                    ])
                    
                    
                    
                    //                RadialGradient(colors: [Color("NightSkyBlackCenter"), Color("NightSkyBlackOuter")], center: .center, startRadius: 30, endRadius: 1000)
                    .ignoresSafeArea()
                    
                    VStack {
                        Image("iconDef")
                            .resizable()
                            .frame(width: 250, height: 250)
                            .cornerRadius(30)
                        
                        Text("Celestia")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                            .padding()
                        
                        Text("Welcome in your safe space.")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.white)
                        
                        NavigationLink(destination: SecondOnBoardingView()
                            .navigationBarBackButtonHidden(true)) {
                                Text("Start the experience.")
                                    .bold()
                                    .padding(15)
                                    .background(.ultraThinMaterial)
                                    .foregroundColor(.black)
                                    .cornerRadius(15)
                                    .clipShape(Rectangle())
                                    .padding(30)
                            }
                    }
                }
            }
        }
    }
}
#Preview {
    FirstOnBoardingView().environment(ConstellationViewModel())
}
