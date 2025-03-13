//
//  FirstOnBoardingView.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 12/03/25.
//

import SwiftUI

struct FirstOnBoardingView: View {
    var body: some View {
        NavigationStack {
        ZStack {
//            Image("T")
//                .ignoresSafeArea()
            RadialGradient(colors: [Color("NightSkyBlackCenter"), Color("NightSkyBlackOuter")], center: .center, startRadius: 30, endRadius: 1000)
                .ignoresSafeArea()
            
            VStack {
                Image("T")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .cornerRadius(30)
                
                Text("Placeholder")
                    .font(.title)
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

#Preview {
    FirstOnBoardingView()
}
