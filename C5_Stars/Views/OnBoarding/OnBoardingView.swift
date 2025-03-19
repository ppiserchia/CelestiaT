//
//  FirstOnBoardingView.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 12/03/25.
//
// If you want more informations about the TimelineView: https://developer.apple.com/documentation/swiftui/timelineview

import SwiftUI

struct OnBoardingView: View {
    //MARK: Setting up the properties for the animation
    @State var textCounter: Int = 0
    @State private var onBoardingTwoEnd: Bool = false
    
    var body: some View {
        NavigationStack {
            //We use the geometry reader, in order to indicate the size of the rectangle that the user has to click to pass from a text to another.
        GeometryReader { screen in
            
            
            //MARK: We use a TimelineView to set the coordinates for the MeshGradient.
            TimelineView(.animation) { timeline in
                let x = (sin(timeline.date.timeIntervalSince1970) + 1) / 2
                
                ZStack {
                    
                //MARK: Setting up the MeshGradient: select the coordinates
                    MeshGradient(width: 3, height: 3, points: [
                        [0, 0], [0.5, 0], [1, 0],
                        [0, 0.5], [0.5, Float(x)], [1, 0.5],
                        [0, 1], [0.5, 1], [1, 1]
                        
                //MARK: Setting up the MeshGradient: Set up the colors
                    ], colors: [
                        .black, .black, .black,
                        .gray, .black, .gray,
                        .black, .black, .black
                    ])
                    .ignoresSafeArea()
                    
                    //MARK: Setting up the sequence of text that are going to appear. We're dividing the sequences in cases.
                    switch textCounter {
                        
                        // First text
                    case 0:
                        VStack {
                            Text("Your safe space")
                                .foregroundStyle(.white)
                                .font(.system(size: 40, weight: .bold))
                                .multilineTextAlignment(.leading)
                            
                        }
                        
                        // Second text
                    case 1:
                        VStack {
                            Text("""
                                Whenever
                                you want,
                                """)
                            .foregroundStyle(.white)
                            .font(.system(size: 40, weight: .bold))
                            .multilineTextAlignment(.leading)
                        }
                        
                        // Third text
                    case 2:
                        VStack {
                            Text("""
                wherever 
                you want.
                """)
                            .foregroundStyle(.white)
                            .font(.system(size: 40, weight: .bold))
                            .multilineTextAlignment(.leading)
                        }
                        
                        // Fourth text
                    case 3:
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
                        
                        // Fith text
                    case 4:
                        HStack {
                            Text("""
They are made up
of unique stories
""")
                            .foregroundStyle(.white)
                            .font(.system(size: 40, weight: .bold))
                            .multilineTextAlignment(.leading)
                        }
                       
                        // Sixth text
                    case 5:
                        HStack {
                            Text("""
Just as you are.
""")
                        }
                        .foregroundStyle(.white)
                        .font(.system(size: 40, weight: .bold))
                        .multilineTextAlignment(.leading)
                       
                        // Seventh text
                    case 6:
                        NavigationLink(destination: NightSkyView().navigationBarBackButtonHidden()) {
                            VStack {
                                Image("star_asset")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                Text("Start")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 40, weight: .bold))
                                    .multilineTextAlignment(.leading)
                            }
                        }
                       // Setting up a default value, in case one of the other cases doesn't work.
                    default:
                        Text("")
                        
                    }
                    // --------------------------------
                    
                    //MARK: Everytime the user clicks on the text, a fading animation will pop up. The following code is about this:
                    
                    if textCounter < 6 {
                        Button {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                textCounter += 1
                            }
                        }
                        
                        //MARK: Setting up a huge button that has a shape of a rectangle, that allows the user to pass from a text to another, by clicking on it.
                        
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
      }
 //MARK: Inject the ConstellationViewModel via the environment modifier, because we're passing from the OnBoardingView to the NightSkyView, where the VM is actually used.

#Preview {
    OnBoardingView()
        .environment(ConstellationViewModel())
}

#Preview("Spanish") {
    OnBoardingView()
        .environment(\.locale, Locale(identifier: "es"))
        .environment(ConstellationViewModel())
}
