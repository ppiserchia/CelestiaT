//
//  StarDetailView.swift
//  C5_Stars
//
//  Created by Luis Mario Recinos Hernández  on 28/02/25.
//
///What is presented whenever the user clicks on a contellation

import SwiftUI

struct StarDetailView: View {
    var body: some View {
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
            Text("Constellation frame")
                .foregroundColor(.white)
                .frame(width: 350, height: 260)
            //-----------------------
            
        }
        .frame(width: 370)
    }
}

#Preview {
    ZStack {
        Color(.black)
            .ignoresSafeArea()
        StarDetailView()
    }
}
