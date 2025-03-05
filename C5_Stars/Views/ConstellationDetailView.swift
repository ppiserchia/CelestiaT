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
    ZStack{
        Color(.black)
            .ignoresSafeArea()
        VStack (spacing: 1){
            Text("Whatever De Whateveris")
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .bold))
            HStack{
                Text("@Whatever")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .padding(.leading)
                Spacer()
            }
            //-----------------------
            //Constellation View
            ConstellationView()
                .frame(width: 350, height: 260)
            //-----------------------
            Image("paper_rectangle")
                .resizable()
            
            
        }
        .frame(width: 370)
    }
}
}


//#Preview {
//    ConstellationDetailView()
//}
