//
//  PromptStoryView.swift
//  C5_Stars
//
//  Created by Luis Mario Recinos Hernández  on 07/03/25.
//

import SwiftUI

struct PromptStoryView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .background(.thinMaterial)
                .cornerRadius(40)
            Text("Constellation Title")
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
        PromptStoryView()
    }
}
