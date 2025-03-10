//
//  TestView.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 07/03/25.
//
import SwiftUI

struct TestView: View {
    
    @Environment(StarViewModel.self) var starsVM
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(starsVM.marcoConstellation) { star in
                    
                    NavigationLink {
                        TestView1(star: StarModel(
                            starPrompt: star.starPrompt,
                            user: star.user,
                            starStory: star.starStory)
                        )
                    } label: {
                        
                        Text(star.starPrompt.PromptName)
                        
                    }
                }
                
                
                
                
            }
            .navigationTitle("Stars")
        }
        
    }
}
#Preview {
    TestView()
        .environment(StarViewModel())
}
