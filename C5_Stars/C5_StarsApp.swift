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
    
    var body: some Scene {
        WindowGroup {
            NightSkyView()
                .environmentObject(constellationVM)
        }
    }
}

