//
//  OnboardingView.swift
//  Guess Watt
//
//  Created by Gabrielle on 1.01.2025.
//

import SwiftUI
import WebKit

struct OnboardingView: View {
    @Binding var hasSeenOnboarding: Bool
    @State private var showContentView = false
    
    var body: some View {
        VStack {
            if showContentView {
                ContentView()
            } else {
                WelcomeView(isWelcomeSheetShowing: .constant(true))
                Button {
                    withAnimation {
                        showContentView = true
                        hasSeenOnboarding = true
                        UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
                    }
                } label: {
                    Text("Continue")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .frame(minWidth:0, maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(50)
                        .padding(.horizontal, 16)
                }
                .padding()
                if showContentView {
                    ContentView()
                        .transition(.slide)
                }
            }
        }
        .onAppear {
            if hasSeenOnboarding {
               showContentView = true
            }
        }
    }
}
#Preview {
    OnboardingView(hasSeenOnboarding: .constant(false))
}

struct PageInfo: Identifiable {
    let id = UUID()
    let label: String
    let text: String
    let gifName: String
}

struct GifImage: UIViewRepresentable {
    private let name: String

    init(_ name: String) {
        self.name = name
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )
        webView.scrollView.isScrollEnabled = false
        webView.configuration.mediaTypesRequiringUserActionForPlayback = []

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }

}

let pages = [
    PageInfo(label: "", text: "AI is experiencing explosive growth", gifName: "increase"),
    PageInfo(label: "", text: "And shows no sign of slowing down", gifName: "battery"),
    PageInfo(label: "", text: "With data transparency and education, we can learn how it impacts our world", gifName: "earth"),
]

struct WelcomeView: View{
    @Binding var isWelcomeSheetShowing: Bool
    
    var body: some View {
        VStack {
            TabView {
                ForEach(pages) { page in
                    VStack {
                        Text(page.label)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text(page.text)
                            .fontWeight(.medium)
                            .padding()
                        
                        GifImage(page.gifName)
                            .frame(height: 200)
                            .padding()
                    }
                }
            }
        }
        .interactiveDismissDisabled()
        .tabViewStyle(.page)
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .label
            UIPageControl.appearance().pageIndicatorTintColor = .systemGray
        }
    }
}

