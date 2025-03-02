//
//  NightSkyView.swift
//  C5_Stars
//
//  Created by Luis Mario Recinos Hernández  on 28/02/25.
//

///This will be the landing view after opening the App, in it, the nightsky will be displayed as a scrollable space where to
///
///     • Create your own constellation
///
///     • See your own constellation
///
///     • Find new constellations
///
///     In this ScrollView, we can move the items indicated below anywhere, but they will return at the center.
///     Our aim is to move the items anywhere, and they don't have to return at the center.

import SwiftUI

struct NightSkyView: View {
    var body: some View {
        ScrollView() {
            
            Image(systemName: "rectangle")
                .padding(.horizontal)
            Image(systemName: "rectangle")
                .padding()
            Image(systemName: "rectangle")
                .padding()
            Image(systemName: "rectangle")
                .padding()

        }
    }
}

#Preview {
    NightSkyView()
}
