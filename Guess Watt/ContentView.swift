//
//  ContentView.swift
//  Guess Watt
//
//  Created by Gabrielle on 11.01.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("spade")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .padding(.top, -80)
                    
                    NavigationLink("GO TO QUIZ", destination: QuizView())
                        .font(.system(size: 20, weight: .bold))
                        .buttonStyle(.borderedProminent)
                        .cornerRadius(15)
                        .foregroundColor(Color(UIColor(red: 0xFC / 255.0, green: 0xFA / 255.0, blue: 0xE2 / 255.0, alpha: 1.0)))
                        .tint(Color(UIColor(red: 0x4E / 255.0, green: 0x64 / 255.0, blue: 0x30 / 255.0, alpha: 1.0)))
                        .padding(.top, -50)
                    
                    NavigationLink("LEARN MORE", destination: LearnmoreView())
                        .font(.system(size: 20, weight: .bold))
                        .buttonStyle(.borderedProminent)
                        .cornerRadius(15)
                        .foregroundColor(Color(UIColor(red: 0x4E / 255.0, green: 0x64 / 255.0, blue: 0x30 / 255.0, alpha: 1.0)))
                        .tint(Color(UIColor(red: 0xFC / 255.0, green: 0xFA / 255.0, blue: 0xE2 / 255.0, alpha: 1.0)))
                        .padding(.top, -10)
                }
                .padding()
                //.scrollContentBackground(.hidden)
                //.frame(maxWidth: .infinity, maxHeight: .infinity)
                // .background {
                //    Color(UIColor(red: 0xAD / 255.0, green: 0x9F / 255.0, blue: 0x22 / 255.0, alpha: 1.0))
                //             .ignoresSafeArea()
                
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
 
//(UIColor(red: 0x81 / 255.0, green: 0x9F / 255.0, blue: 0x25 / 255.0, alpha: 1.0)
