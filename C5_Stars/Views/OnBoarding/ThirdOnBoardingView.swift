//
//  ThirdOnBoardingView.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 13/03/25.
//

import SwiftUI

struct ThirdOnBoardingView: View {
    //MARK: Declaring variables for the animations
//    @State private var firstRectangle = false
//    @State private var secondRectangle = false
//    @State private var thirdRectangle = false
//    @State private var fourthRectangle = false
    
    //MARK: Declaring the property for the animation
    @State var textCounter: Int = 0
    @State private var onBoardingEnd: Bool = false

    var body: some View {
        GeometryReader { screen in
            TimelineView(.animation) { timeline in
                let x = (sin(timeline.date.timeIntervalSince1970) + 1) / 2
                
                NavigationStack {
                    
                    //MARK: Setting up the View
                    ZStack {
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
                        .ignoresSafeArea()
                        // -----------------
                        
                        //MARK: creating the animation
                        switch textCounter {
                        case 0:
                            VStack {
                                HStack {
                                    Text("""
Explore constellations
""")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 40, weight: .bold))
                                    .multilineTextAlignment(.leading)
                                }
                            }
                            
                        case 1:
                            HStack {
                                Text("""
They are made up
of unique stories
""")
                                .foregroundStyle(.white)
                                .font(.system(size: 40, weight: .bold))
                            }
                            
                        case 2:
                            HStack {
                                Text("""
Just as you are.
""")
                            }
                            .foregroundStyle(.white)
                            .font(.system(size: 40, weight: .bold))
                            .multilineTextAlignment(.leading)
                            
                        case 3:
                            NavigationLink(destination: NightSkyView()
                                .navigationBarBackButtonHidden(true)) {
                                    Image("star_asset")
                                        .resizable()
                                        .frame(width: 180, height: 180)
                                }
                            
                        default:
                            Text("")
                        }
                    
                    
                    Button {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            textCounter += 1
                        }
                        
                        if textCounter == 3 {
                            withAnimation(.bouncy(duration: 3).delay(0.5)) {
                                onBoardingEnd.toggle()
                            }
                        }
                    }
                        //MARK: create the rectangle that is clickable
                        label: {
                        Rectangle()
                            .frame(maxWidth: screen.size.width, maxHeight: screen.size.height)
                            .opacity(0)
                    }
                    }
                }
            }
        }
     }
   }

#Preview {
    ThirdOnBoardingView().environment(ConstellationViewModel())
}
