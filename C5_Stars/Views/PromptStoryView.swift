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
                .background(.ultraThinMaterial)
                .cornerRadius(40)
            VStack {
                Text("Prompt Story")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 350)
                
                Divider()
                    .frame(width: 300, height: 2)
                    .overlay(.white)
    
                Text("Lore ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor quam id massa faucibus dignissim. Nullam eget metus id nisl malesuada condimentum. Nam viverra fringilla erat, ut fermentum nunc feugiat eu.")
                    .font(.system(size: 27, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 350)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}

#Preview {
    ZStack{
        Image("T")
        PromptStoryView()
            .frame(width: 350, height: 600)
    }
}
