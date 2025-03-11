//
//  PromptTitleView.swift
//  C5_Stars
//
//  Created by Luis Mario Recinos Hernández  on 07/03/25.
//

import SwiftUI

struct ConstellationTitle: View {
    
    @Environment(ConstellationViewModel.self) var constellationVM
    
    var constellationTitle: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .background(.ultraThinMaterial)
                .cornerRadius(40)
            //This recieves a string from the user constellation selection inside of the NightSkyView
            Text(constellationTitle)
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
        ConstellationTitle(constellationTitle: "Preview Placeholer").environment(ConstellationViewModel())
            .frame(width: 350, height: 130)
    }
}
