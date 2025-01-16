//
//  Guess_WattApp.swift
//  Guess Watt
//
//  Created by Gabrielle on 11.01.2025.
//

import SwiftUI

@main
struct GuessWattApp: App {
    @State private var hasSeenOnboarding: Bool = UserDefaults.standard.bool(forKey: "hasSeenOnboarding")
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                ContentView()
                    .environment(\.font, .system(.body, design: .rounded))
            } else {
                OnboardingView(hasSeenOnboarding: $hasSeenOnboarding)
            }
        }
    }
}
