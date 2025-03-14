//
//  SecondOnBoardingView.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 12/03/25.
//
import SwiftUI

struct SecondOnBoardingView: View {
    var body: some View {
        
        TimelineView(.animation) { timeline in
            let x = (sin(timeline.date.timeIntervalSince1970) + 1) / 2
            
            NavigationStack {
                
                
                ZStack {
                    //            Image("T")
                    
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
                    
                    Rectangle()
                        .background(.thickMaterial)
                        .cornerRadius(50)
                        .frame(width: 370, height: 300)
                    
                    VStack {
                        Text("Your safe space.")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .frame(width: 350)
                            .multilineTextAlignment(.leading)
                        
                        Text("""
Whenever you want,
wherever you want.
""")
                        .font(.title)
                        .frame(width: 350, height: 70)
                        .multilineTextAlignment(.leading)
                        
                        NavigationLink(destination: ThirdOnBoardingView()
                            .navigationBarBackButtonHidden(true)) {
                                Text("Continue...")
                                    .bold()
                                    .padding(15)
                                    .foregroundStyle(.black)
                                    .background(.ultraThickMaterial)
                                    .cornerRadius(15)
                                    .clipShape(Rectangle())
                                    .padding(10)
                            }
                    }
                }
                
            }
        }
    }
}
#Preview {
    SecondOnBoardingView()
}
