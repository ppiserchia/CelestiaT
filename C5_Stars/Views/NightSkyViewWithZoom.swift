//
//  NightSkyViewWithZoom.swift
//  C5_Stars
//
//  Created by Gina Saviano on 10/03/25.
//

import SwiftUI

struct NightSkyViewWithZoom: View {
    /*
     The Namespace property links two views: this estabilishes the connection between the two views.
     */
    @Namespace private var namespace
    
    var numberOfStarsNightZoom: Int
    var constellationNightSkyWithZoomTitle: String
    var stars: [StarModel]
    
    var body: some View {
        NavigationStack{
            //here is where we're supposed to insert the navigation link
            NavigationLink {
                ConstellationDetailView(constellationDetailViewTitle: constellationNightSkyWithZoomTitle, stars: stars)
                    .navigationTransition(.zoom(sourceID: "zoomTransition", in: namespace))
            } label: {
                ZStack{
                    GeometryReader { geometry in
                        ZStack {
                            ConstellationView(numberOfStars: numberOfStarsNightZoom)
                                .frame(width: 400, height: 500)               .matchedTransitionSource(id: "zoomTransition", in: namespace)
                        }
                        
                    }
                    .ignoresSafeArea()
                }
            }
        }
    }
}


#Preview {
    NightSkyViewWithZoom(numberOfStarsNightZoom: 5, constellationNightSkyWithZoomTitle: "Creative Beaver",
         stars: [
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
             ]
    )
}
