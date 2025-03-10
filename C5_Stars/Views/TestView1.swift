//
//  TestView1.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 07/03/25.
//

import SwiftUI

struct TestView1: View {
    
    var star: StarModel
    
    var body: some View {
        NavigationStack {
            
                Text(star.starStory)
                    .padding(.horizontal)
                
        }
        .navigationTitle("User: \(star.user)")
    }
}
//#Preview {
//    TestView1()
//        .environment(StarViewModel())
//}
