//
//  PromptStoryView.swift
//  C5_Stars
//
//  Created by Luis Mario Recinos Hernández  on 07/03/25.
//

import SwiftUI

struct PromptStoryView: View {

//    var promptName: Prompt
//    var promptStory: String
    var stars: [StarModel]
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.nightSkyBlackCenter)
                .cornerRadius(15)
                .frame(width: 210, height: 100)
                .offset(x: -65, y: -224)
            //FOR EACH
            Text(stars[0].starPrompt.PromptName)
                .font(.system(size: 17, weight: .heavy))
                .foregroundColor(.white)
                .offset(x: -65, y: -245)
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(50)
                .frame(width: 340, height: 440)
            VStack {
                //FOR EACH
                Text(stars[0].starStory)
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
//        PromptStoryView(promptName: Prompt(PromptName: "Coming out"),
//                        promptStory: "Lore ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor quam id massa faucibus dignissim. Nullam eget metus id nisl malesuada condimentum. Nam viverra fringilla erat, ut fermentum nunc feugiat eu.")
        PromptStoryView(stars: [
            StarModel(
                 starPrompt: Prompt(PromptName: "Coming out"),
                 user: "Creative Beaver",
                 starStory: "For me coming out is BIG topic for me, it’s one of this thing that feels sometimes wrong to do, because you will never know how people are going to react, maybe they not even care but for me at least , I feel like that , i feel exposed almost, it’s like if i put a big sign over my head with light on, maybe it’s just anxiety that’s talking but in general i talk about my sexuality ,experience etc with people I feel that are not going to judge or People that are curious about this kind of topic. But it’s again coming out it’s not a big of deal I come out to my mother and she accept me and I’m happy! Sometimes it can be hard and sometimes it’s the most liberating thing you can do with yourself."),
            
            StarModel(
                 starPrompt: Prompt(PromptName: "Gender Identity"),
                 user: "Creative Beaver",
                 starStory: "it’s a big topic for me also because it’s a bit funny , I still don’t know how do I feel about myself , I know that I’m not cis person, but I don’t know exactly how to define myself I don’t want to be label in something and I’m fine with it! I only like the term “non binary” for my gender identity because is the closest thing that feels what I’m going trough right now, I’m not confused or anything it’s just hard to define myself especially for my sexuality. People also when I tell this they usually label me as Gay or lesbian and everything you can imagine , but I just want to be me and that’s good enough ( i don’t know if it’s cringe sorry in advance)"),
            
            StarModel(
                 starPrompt: Prompt(PromptName: "Media representation"),
                 user: "Creative Beaver",
                 starStory: "For me in media there is still work to do in representation, but we are in a good Start , especially in cartoons! And I’m so happy that the new generations can grow up maybe with a better representation not only for the LGBTQIA’s+ , but also the black community and everyone that feel not represented enough in their life. Good example of this is Craig of the Creek! A beautiful cartoon with a different cast of characters, with beautiful visual and story! Also each one of the characters is important and their identity don’t feel force or too much weird, it feels natural, and should be like this in every media that we consume , that’s not weird to see this kind of representation, it should be normal.")
            ])
            .frame(width: 350, height: 600)
    }
}
