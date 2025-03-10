//
//  StarViewModel.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 26/02/25.
//

/// The StarViewModel is going to describe deeply how the item we chose(in this case, the "star") looks like, describing it precisely.

import Foundation
import SwiftUI
//To make this file available for other files to see, and use
@Observable

class StarViewModel: ObservableObject {
    
    // These 6 stars 
    
    var rudyConstellation: [StarModel] = [
        StarModel(
             starPrompt: Prompt(PromptName: "Coming out"),
             user: "Creative Beaver",
             starStory: "For me coming out is BIG topic for me, it’s one of this thing that feels sometimes wrong to do, because you will never know how people are going to react, maybe they not even care but for me at least , I feel like that , i feel exposed almost, it’s like if i put a big sign over my head with light on, maybe it’s just anxiety that’s talking but in general i talk about my sexuality ,experience etc with people I feel that are not going to judge or People that are curious about this kind of topic. But it’s again coming out it’s not a big of deal I come out to my mother and she accept me and I’m happy! Sometimes it can be hard and sometimes it’s the most liberating thing you can do with yourself."),
        
        StarModel(
             starPrompt: Prompt(PromptName: "Gender Identity"),
             user: "@Creative Beaver",
             starStory: "it’s a big topic for me also because it’s a bit funny , I still don’t know how do I feel about myself , I know that I’m not cis person, but I don’t know exactly how to define myself I don’t want to be label in something and I’m fine with it! I only like the term “non binary” for my gender identity because is the closest thing that feels what I’m going trough right now, I’m not confused or anything it’s just hard to define myself especially for my sexuality. People also when I tell this they usually label me as Gay or lesbian and everything you can imagine , but I just want to be me and that’s good enough ( i don’t know if it’s cringe sorry in advance)"),
        
        StarModel(
             starPrompt: Prompt(PromptName: "Media representation"),
             user: "@Creative Beaver",
             starStory: "For me in media there is still work to do in representation, but we are in a good Start , especially in cartoons! And I’m so happy that the new generations can grow up maybe with a better representation not only for the LGBTQIA’s+ , but also the black community and everyone that feel not represented enough in their life. Good example of this is Craig of the Creek! A beautiful cartoon with a different cast of characters, with beautiful visual and story! Also each one of the characters is important and their identity don’t feel force or too much weird, it feels natural, and should be like this in every media that we consume , that’s not weird to see this kind of representation, it should be normal.")
        ]

    
    var marcoConstellation: [StarModel] = [
        StarModel(
             starPrompt: Prompt(PromptName: "Family"),
             user: "Marco",
             starStory: "I am the youngest between two brothers. My mom was very strict with me, and at first she didn't accept the fact that I was transitioning. My father didn't agree with my mom, and helped me not only morally standing for me and saying \"If I loved you as a girl, I will love you also as a boy, because you're my child\", but also financially. In the first years of transitioning, my mother didn't call me with my actual name, and that caused more and more problems in terms of the relationship I had with her. Now, after some time and disputes, my mother understood and she accepts me as I am. I forgive her for what she did in the past, for being so strict with me, and now we have a stabler relationship."),
        
        StarModel(
             starPrompt: Prompt(PromptName: "ID Change"),
             user: "Marco",
             starStory: "I began the process 4 years ago, but changing my ID wasn't that simple. Bureaucratically speaking, the process itself wasn't easy, especially when the court of Salerno 2 years ago \"lost\" all the papers related to me, so I had to choose whether waiting for the bureaucracy to do the process, or paying a lawyer to help loose the process a little bit and at least, have my documents updated. I decided the second choice, paying over 5.000€, with my father's financial help. Also, I had some bureaucracy issues in enrolling at the University, just because I couldn't change my documents in a very short time."
        ),
        
        
        StarModel(
                  starPrompt: Prompt(PromptName: "Clubbing"),
                  user: "Marco",
                  starStory: "Clubbing is supposed to be fun for everyone, still as a trans person it can and it has been tricky for me, for many years. I'm a very energic and bubbly kind of guy and so I've been wanting to club since my teen years but I wasn't always confident enough to just go and have fun. When you're not comfortable in your own skin it's incredibly hard to just go and dance pressed against that many strangers. Fear and dysphoria have stopped me from enjoying the night life for way too much either because I felt  like I could not pass as a man, or that I couldn't wear club clothes that made me feel confident. Nowadays, no matter how much it took me, I'm grateful I can enjoy my youth the way I want to, dress the way I want and not fear being outed or hurt in any way when I go out clubbing. I still rather go to a queer club because I feel safer and at home, but it's a huge accomplishment for me, at this point in my transition, to be enjoying every sort of night club and know that my identity is not in danger nor ridiculed. I can just be me and live the moment."
                  )
        
    ]
    
}

