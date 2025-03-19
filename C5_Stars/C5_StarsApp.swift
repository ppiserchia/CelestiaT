//
//  C5_StarsApp.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 26/02/25.
//

import SwiftUI

@main
struct C5_StarsApp: App {
    var constellationVM = ConstellationViewModel()
    @State private var hasCompletedOnboarding: Bool = PersistenceManager.shared.hasLaunchedBefore()
    
    var body: some Scene {
        WindowGroup {
            if !hasCompletedOnboarding {
                OnBoardingView(hasCompletedOnboarding: $hasCompletedOnboarding)
                    .environmentObject(constellationVM)
                    .onDisappear {
                        // Set that the app has been launched when onboarding disappears
                        PersistenceManager.shared.setAppHasLaunched()
                    }
            } else {
                NightSkyView()
                    .environmentObject(constellationVM)
            }
        }
    }
}

