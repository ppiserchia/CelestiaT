//
//  ContentView.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 26/02/25.
//

import SwiftUI

struct ContentView: View {
@EnvironmentObject var stars: Stars // with the Environment wrapper, we recall the ViewModel class Star that we created.
    

    var body: some View {
        NavigationStack {
        List {
// In the ForEach we're declaring it like this: variableNameCalled.arrayClassNameInTheVM
            
            ForEach(stars.stars, id: \.id) { star in
                Section {
                    VStack {
                        
                        // in order to let the name of the star appear in this list, we're calling the text nameOfTheItem.nameOfTheProperty
                        
                        Text(star.starName)
                    }
                    
                    VStack {
                        
                        Text(star.user)
                    }
                }
            }
    }
}
}
}

#Preview {
    ContentView()
        .environmentObject(Stars()) // here we declare the ViewModel class again, so it can appear in the Preview.
}
