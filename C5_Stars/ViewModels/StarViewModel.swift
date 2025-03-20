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
            starPrompt: Prompt(PromptName: ("Coming Out")),
             user: "Creative Beaver",
             starStory: "For me coming out is BIG topic for me, it’s one of this thing that feels sometimes wrong to do, because you will never know how people are going to react, maybe they not even care but for me at least , I feel like that , i feel exposed almost, it’s like if i put a big sign over my head with light on, maybe it’s just anxiety that’s talking but in general i talk about my sexuality ,experience etc with people I feel that are not going to judge or People that are curious about this kind of topic. But it’s again coming out it’s not a big of deal I come out to my mother and she accept me and I’m happy! Sometimes it can be hard and sometimes it’s the most liberating thing you can do with yourself."
        ),
        
        StarModel(
             starPrompt: Prompt(PromptName: ("Gender Identity")),
             user: "Creative Beaver",
             starStory: "it’s a big topic for me also because it’s a bit funny , I still don’t know how do I feel about myself , I know that I’m not cis person, but I don’t know exactly how to define myself I don’t want to be label in something and I’m fine with it! I only like the term “non binary” for my gender identity because is the closest thing that feels what I’m going trough right now, I’m not confused or anything it’s just hard to define myself especially for my sexuality. People also when I tell this they usually label me as Gay or lesbian and everything you can imagine , but I just want to be me and that’s good enough ( i don’t know if it’s cringe sorry in advance)"),
        
        StarModel(
             starPrompt: Prompt(PromptName: ("Media Representation")),
             user: "Creative Beaver",
             starStory: "For me in media there is still work to do in representation, but we are in a good Start , especially in cartoons! And I’m so happy that the new generations can grow up maybe with a better representation not only for the LGBTQIA’s+ , but also the black community and everyone that feel not represented enough in their life. Good example of this is Craig of the Creek! A beautiful cartoon with a different cast of characters, with beautiful visual and story! Also each one of the characters is important and their identity don’t feel force or too much weird, it feels natural, and should be like this in every media that we consume , that’s not weird to see this kind of representation, it should be normal.")
        ]

    
    var marcoConstellation: [StarModel] = [
        StarModel(
             starPrompt: Prompt(PromptName: ("Family")),
             user: "Marco",
             starStory: "I am the youngest between two brothers. My mom was very strict with me, and at first she didn't accept the fact that I was transitioning. My father didn't agree with my mom, and helped me not only morally standing for me and saying \"If I loved you as a girl, I will love you also as a boy, because you're my child\", but also financially. In the first years of transitioning, my mother didn't call me with my actual name, and that caused more and more problems in terms of the relationship I had with her. Now, after some time and disputes, my mother understood and she accepts me as I am. I forgive her for what she did in the past, for being so strict with me, and now we have a stabler relationship."),
        
        StarModel(
             starPrompt: Prompt(PromptName: ("ID Change")),
             user: "Marco",
             starStory: "I began the process 4 years ago, but changing my ID wasn't that simple. Bureaucratically speaking, the process itself wasn't easy, especially when the court of Salerno 2 years ago \"lost\" all the papers related to me, so I had to choose whether waiting for the bureaucracy to do the process, or paying a lawyer to help loose the process a little bit and at least, have my documents updated. I decided the second choice, paying over 5.000€, with my father's financial help. Also, I had some bureaucracy issues in enrolling at the University, just because I couldn't change my documents in a very short time."
        ),
        
        
        StarModel(
                  starPrompt: Prompt(PromptName: ("Clubbing")),
                  user: "Marco",
                  starStory: "Clubbing is supposed to be fun for everyone, still as a trans person it can and it has been tricky for me, for many years. I'm a very energic and bubbly kind of guy and so I've been wanting to club since my teen years but I wasn't always confident enough to just go and have fun. When you're not comfortable in your own skin it's incredibly hard to just go and dance pressed against that many strangers. Fear and dysphoria have stopped me from enjoying the night life for way too much either because I felt  like I could not pass as a man, or that I couldn't wear club clothes that made me feel confident. Nowadays, no matter how much it took me, I'm grateful I can enjoy my youth the way I want to, dress the way I want and not fear being outed or hurt in any way when I go out clubbing. I still rather go to a queer club because I feel safer and at home, but it's a huge accomplishment for me, at this point in my transition, to be enjoying every sort of night club and know that my identity is not in danger nor ridiculed. I can just be me and live the moment."
                  )
        
    ]
    
    var criFriendConstellation: [StarModel] = [
        StarModel(
            starPrompt: Prompt(PromptName: "HRT"),
            user: "Fierce Chinchilla",
            starStory: "I haven't yet started HRT because of the issues I'm scared I might face with my current medical issues, but I definitely want to start. However I’ve been slowly coming out to first my girlfriend and then family and friends anyway."
        ),
        
        StarModel(
            starPrompt: Prompt(PromptName: "Coming Out"),
            user: "Fierce Chinchilla",
            starStory: "I first discovered I was trans after meeting another trans person that explained how she and her -also trans- husband had found out. And it aligned a lot with the issues I'd felt with my own body, mind and feelings. Coming out is always hard, it feels like your entire world is about to crumble. You get some pretty nasty fears and thoughts at the start. For me those really disappeared when my family and girlfriend said they loved me no matter what and would support me in what I wish to do."
        ),
        
        StarModel(
            starPrompt: Prompt(PromptName: "Dysphoria"),
            user: "Fierce Chinchilla",
            starStory: "At first I didn't realize how bad my dysphoria was affecting me on a personal level and the relationships I’d had. After I realized I was trans I started to change a lot of things slowly. I learned to change my vocal range and talk more feminine and started growing out my hair. Some days my dysphoria is worse than others, but doing small things like growing my hair has been helping me a lot. Even practicing makeup!"
        ),
        
        StarModel(
            starPrompt: Prompt(PromptName: "Love Life"),
            user: "Fierce Chinchilla",
            starStory: "My love life at first suffered very heavily. I’d been in a one year relationship at the time where she'd gotten so used to seeing me as something else. And suddenly it gets flipped on its head. The whole dynamic started to shift and it took a lot of time and communication to figure it out between me and her. However, now we are in a situationship and she's my biggest supporter."
        ),
        
        StarModel(
            starPrompt: Prompt(PromptName: "Community"),
            user: "Fierce Chinchilla",
            starStory: "I think we have amazing and inclusive groups! Like r/trans or r/asktrans, to help cis people understand and talk to people without being scared of making us uncomfortable or worried that we could take what they say as a statement rather than genuine curiosity. I'm personally not very active in those spaces and I feel that's been the best thing for me."
        ),
        
        StarModel(
            starPrompt: Prompt(PromptName: "Surgery"),
            user: "Fierce Chinchilla",
            starStory: "Gender dysphoria has been very difficult for me, so it's been hard not to run into a hospital and ask for everything to be done asap. However I think I need to let my mind slowly adapt to myselt and my body. I'm definitely planning on getting everything done that I need/want! But in due time."
        ),

    ]
    
    var gabriConstellation: [StarModel] = [
        StarModel(starPrompt: Prompt(PromptName: "Friends"),
                  user: "Gabri",
                  starStory: "For me, the term friendship is like saying, ''I help you recognise yourself and recognize parts of me in you and vice versa, I can't promise that everything I'll show you will like it, but don't be afraid, if you're scared, and I can promise this, I will take you by my hand.'' "),
        
        StarModel(starPrompt: Prompt(PromptName: "HRT"),
                  user: "Gabri",
                  starStory: "Maybe as a synonym I would associate the word ''restitution''. Hormone therapy brought me back to myself. I now recognize the reflection that the mirror sends back to me, it is a reflection from which I no longer run away or look at it timidly (and fearfully) out of the corner of my eye, but in which (today) I like to glimpse what was once only a shadow, an abstract image."),
        
    ]
}
