//
//  PromptTitleView.swift
//  C5_Stars
//
//  Created by Luis Mario Recinos Hernández  on 07/03/25.
//

import SwiftUI

struct ConstellationTitle: View {
    
    @EnvironmentObject var constellationVM: ConstellationViewModel
    
    var selectedConstellationTitle: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .background(.ultraThinMaterial)
                .cornerRadius(40)
            //This recieves a string from the user constellation selection inside of the NightSkyView
            Text(selectedConstellationTitle)
                .font(.system(size: 35, weight: .bold))
                .foregroundColor(.white)
                .padding()
                .frame(width: 350)
        }
    }
}

#Preview {
    ZStack{
        Image("T")
        ConstellationTitle(selectedConstellationTitle: "Placeholder").environmentObject(ConstellationViewModel())
            .frame(width: 350, height: 130)
    }
}
