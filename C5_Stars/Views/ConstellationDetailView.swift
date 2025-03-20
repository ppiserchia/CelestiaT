//
//  StarDetailView.swift
//  C5_Stars
//
//  Created by Luis Mario Recinos Hernández  on 28/02/25.
//
///What is presented whenever the user clicks on a constellation

import SwiftUI

struct ConstellationDetailView: View {

    @EnvironmentObject var viewModel: StarViewModel
    var constellationDetailViewTitle: String
    var stars: [StarModel]
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                RadialGradient(colors: [Color("NightSkyBlackCenter"), Color("NightSkyBlackOuter")], center: .center, startRadius: 30, endRadius: 1000)
                    .frame(width: 700 * 10, height: 700 * 10)
                    .ignoresSafeArea()
                VStack {
                    ConstellationTitle(selectedConstellationTitle: constellationDetailViewTitle)
                        .frame(width: 350, height: 100)
                        .padding(20)
                    
                    ZStack{
                        //Preview of the constellation selected
                        ConstellationView(numberOfStars: stars.count, constellationName: constellationDetailViewTitle)
                            .position(x: geometry.size.width / 2, y: geometry.size.height * 0.0009)
                            .frame(height: 400)
//                            .padding(.bottom)
                        
                        
                        //For checking all of the stories inside of the constellation
                        ScrollView(.horizontal){
                            LazyHStack{
                                ForEach(stars){ star in
                                    PromptStoryView(stars: star)
                                        .frame(width: 350)
                                        .position(x: geometry.size.width / 2, y: geometry.size.height * 0.6)
                                        .scrollTransition { content, phase in
                                            content
                                                .scaleEffect(
                                                    x: phase.isIdentity ? 1.0 : 0.8,
                                                    y: phase.isIdentity ? 1.0 : 0.8
                                                )
                                                .offset(y: phase.isIdentity ? 0: 100)
                                            
                                        }
                                }
                            }
                        }
                        
                    }
                    
                }
            }
        }
    }
}






#Preview {
    ConstellationDetailView(
        constellationDetailViewTitle: "Creative Beaver",
        stars: [
            StarModel(
                 starPrompt: Prompt(PromptName: ("Coming Out")),
                 user: "Creative Beaver",
                 starStory: "For me coming out is BIG topic for me, it’s one of this thing that feels sometimes wrong to do, because you will never know how people are going to react, maybe they not even care but for me at least , I feel like that , i feel exposed almost, it’s like if i put a big sign over my head with light on, maybe it’s just anxiety that’s talking but in general i talk about my sexuality ,experience etc with people I feel that are not going to judge or People that are curious about this kind of topic. But it’s again coming out it’s not a big of deal I come out to my mother and she accept me and I’m happy! Sometimes it can be hard and sometimes it’s the most liberating thing you can do with yourself."),
            
            StarModel(
                 starPrompt: Prompt(PromptName: ("Gender Identity")),
                 user: "Creative Beaver",
                 starStory: "it’s a big topic for me also because it’s a bit funny , I still don’t know how do I feel about myself , I know that I’m not cis person, but I don’t know exactly how to define myself I don’t want to be label in something and I’m fine with it! I only like the term “non binary” for my gender identity because is the closest thing that feels what I’m going trough right now, I’m not confused or anything it’s just hard to define myself especially for my sexuality. People also when I tell this they usually label me as Gay or lesbian and everything you can imagine , but I just want to be me and that’s good enough ( i don’t know if it’s cringe sorry in advance)"),
            
            StarModel(
                 starPrompt: Prompt(PromptName: ("Media Representation")),
                 user: "Creative Beaver",
                 starStory: "For me in media there is still work to do in representation, but we are in a good Start , especially in cartoons! And I’m so happy that the new generations can grow up maybe with a better representation not only for the LGBTQIA’s+ , but also the black community and everyone that feel not represented enough in their life. Good example of this is Craig of the Creek! A beautiful cartoon with a different cast of characters, with beautiful visual and story! Also each one of the characters is important and their identity don’t feel force or too much weird, it feels natural, and should be like this in every media that we consume , that’s not weird to see this kind of representation, it should be normal.")
            ]
        )
}
