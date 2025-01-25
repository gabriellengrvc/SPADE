//
//  SpadeApp.swift
//  SPADE
//
//  Created by Gabrielle on 11.01.2025.
//

import SwiftUI

@main
struct SpadeApp: App {
    @State private var hasSeenOnboarding: Bool = UserDefaults.standard.bool(forKey: "hasSeenOnboarding")
    
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                ContentView()
                    .environment(\.font, .custom("Poppins-Regular", size: 17))
            } else {
                OnboardingView(hasSeenOnboarding: $hasSeenOnboarding)
            }
        }
    }
}
