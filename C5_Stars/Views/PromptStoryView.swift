//
//  PromptStoryView.swift
//  C5_Stars
//
//  Created by Luis Mario Recinos Hernández  on 07/03/25.
//

import SwiftUI

struct PromptStoryView: View {

    var promptName: String
    var promptStory: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.nightSkyBlackCenter)
                .cornerRadius(15)
                .frame(width: 210, height: 100)
                .offset(x: -65, y: -224)
            Text(promptName)
                .font(.system(size: 16, weight: .heavy))
                .foregroundColor(.white)
                .offset(x: -65, y: -251)
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(50)
                .frame(width: 340, height: 460)
            VStack {
                Text(promptStory)
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 320)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 26)
                Spacer()
            }
            .frame(height: 460)
        }
    }
}

#Preview {
    ZStack{
        Image("T")
        PromptStoryView(promptName: "Hormone Therapy", promptStory: "Lore ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor quam id massa faucibus dignissim. Nullam eget metus id nisl malesuada condimentum. Nam viverra fringilla erat, ut fermentum nunc feugiat eu.")
            .frame(width: 350, height: 600)
    }
}
