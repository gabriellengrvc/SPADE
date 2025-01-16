//
//  LearnmoreView.swift
//  Guess Watt
//
//  Created by Gabrielle on 15.01.2025.
//

import SwiftUI

struct LearnmoreView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Created by Gabrielle Gervacio, sources here")
                    .font(.custom("Avenir Next Rounded", size: 17))
            }
            .scrollContentBackground(.hidden)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background {
                        Color(UIColor(red: 0xFC / 255.0, green: 0xFA / 255.0, blue: 0xE2 / 255.0, alpha: 1.0))
                            .ignoresSafeArea()
                    }
        }
    }
}

#Preview {
    LearnmoreView()
}
