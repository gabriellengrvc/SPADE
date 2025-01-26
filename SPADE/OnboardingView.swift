//
//  OnboardingView.swift
//  SPADEs
//
//  Created by Gabrielle on 1.01.2025.
//

import SwiftUI

struct OnboardingView: View {
    @State private var showContentView = false
    
    var body: some View {
        VStack {
            if showContentView {
                ContentView()
                    .transition(.slide)
            } else {
                WelcomeView(isWelcomeSheetShowing: .constant(true))
                Button {
                    withAnimation {
                        showContentView = true
                    }
                } label: {
                    Text("CONTINUE")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .frame(minWidth:0, maxWidth: .infinity)
                        .padding()
                        .background(Color(UIColor(red: 174/255, green: 158/255, blue: 34/255, alpha: 1.0)))
                        .cornerRadius(20)
                        .padding(.horizontal, 16)
                }
                .padding()
            }
        }
        .background(Color(red: 1.0, green: 0.984, blue: 0.953).ignoresSafeArea())
    }
}

struct PageInfo: Identifiable {
    let id = UUID()
    let label: String
    let image: String
}

let pages = [
    PageInfo(label: "", image: "tab1"),
    PageInfo(label: "", image: "tab2"),
    PageInfo(label: "", image: "tab3"),
]

struct WelcomeView: View{
    @Binding var isWelcomeSheetShowing: Bool
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            TabView {
                ForEach(pages) { page in
                    VStack {
                        Text(page.label)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        Image(page.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 500, height: 300)
                            .padding(.top, -20)
                            .scaleEffect(isAnimating ? 1 : 2)
                            .opacity(isAnimating ? 1 : 0)
                            .onAppear {
                                isAnimating = false
                                withAnimation(.easeOut(duration: 0.5)) {
                                    isAnimating = true
                                }
                            }
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = .label
                UIPageControl.appearance().pageIndicatorTintColor = .systemGray
            }
        }
        .interactiveDismissDisabled()
        .tabViewStyle(.page)
        .scrollContentBackground(.hidden)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color(red: 1.0, green: 0.984, blue: 0.953)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    OnboardingView()
}
