//
//  LearnmoreView.swift
//  SPADE
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
                    .padding()
                Text("Created by Gabrielle Gervacio, sources here")
                    .font(.custom("Avenir Next Rounded", size: 17))
            }
            .scrollContentBackground(.hidden)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background {
                        Color(red: 1.0, green: 0.984, blue: 0.953)
                            .ignoresSafeArea()
                    }
        }
    }
}

#Preview {
    LearnmoreView()
}
