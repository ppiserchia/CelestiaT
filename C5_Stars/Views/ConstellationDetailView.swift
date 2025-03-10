//
//  StarDetailView.swift
//  C5_Stars
//
//  Created by Luis Mario Recinos Hernández  on 28/02/25.
//
///What is presented whenever the user clicks on a contellation

import SwiftUI

struct ConstellationDetailView: View {
    var body: some View {
        VStack{
            Text("Constellaton Title")
                .font(.system(size: 45, weight: .bold))
                .foregroundStyle(.white)
            
        }
    }
}


#Preview {
    ZStack{
        Color(.black)
            .ignoresSafeArea()
        ConstellationDetailView()
    }
}
