//
//  StarDetailView.swift
//  C5_Stars
//
//  Created by Luis Mario Recinos Hernández  on 28/02/25.
//
///What is presented whenever the user clicks on a constellation

import SwiftUI

struct ConstellationDetailView: View {
    @EnvironmentObject var constellationVM: ConstellationViewModel
    
    var body: some View {
        
        ZStack {
            
//            Image("T")
            
            VStack {
                
                // In this VStack there are going to be two assets that we created (ConstellationTitle and PromptStoryView); in the middle there's going to be the asset of the chosen constellation.
                
//                ForEach(constellationVM.constellationArray) { constellation in
//                    ConstellationTitle(selectedConstellationTitle: constellation.constellationName)
//                        .frame(width: 350, height: 100)
//                        .padding(20)
//                }
                
                ConstellationTitle(selectedConstellationTitle: constellationVM.constellationArray[0].constellationName)
                    .frame(width: 350, height: 100)
                    .padding(20)
                
                
                Image(systemName: "fan.fill") // Placeholder
                    .font(.system(size: 50, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(20)
                
               // PromptStoryView()
                    .frame(width: 350, height: 500)

                
            }
        }
    }
}


#Preview {
    ZStack{
        Color(.black)
            .ignoresSafeArea()
        ConstellationDetailView().environment(ConstellationViewModel())
    }
}
