//
//  LearnmoreView.swift
//  SPADE
//
//  Created by Gabrielle on 15.01.2025.
//

import SwiftUI

struct LearnmoreView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var sources1: [(name: String, url: String)] = [
        ("Code Carbon", "https://codecarbon.io/"),
        ("Green Algorithms Calculator", "https://www.green-algorithms.org/"),
        ("ML CO2 Impact", "https://mlco2.github.io/impact/#compute")
        ]
    var sources2: [(name: String, url: String)] = [
        ("GPUs for AI, Google Cloud", "https://cloud.google.com/discover/gpu-for-ai"),
        ("Can Language Models Be Too Big?", "https://dl.acm.org/doi/10.1145/3442188.3445922"),
        ("Tackling AI’s Climate Change Problem, MITSloan", "https://sloanreview.mit.edu/article/tackling-ais-climate-change-problem/"),
        ("Data Centers and AI, Mckinsey & Company", "https://www.mckinsey.com/industries/private-capital/our-insights/how-data-centers-and-the-energy-sector-can-sate-ais-hunger-for-power"),
        ("Generative AI, Deloitte Insights", "https://www2.deloitte.com/us/en/insights/industry/technology/technology-media-and-telecom-predictions/2025/genai-power-consumption-creates-need-for-more-sustainable-data-centers.html"),
        ("AI’s true carbon footprint, MIT Technology Review", "https://www.technologyreview.com/2022/11/14/1063192/were-getting-a-better-idea-of-ais-true-carbon-footprint/"),
        ("Why AI needs so much energy", "https://newsletter.armand.so/p/ai-needs-much-energy"),
        ("How to Make Generative AIs Greener, Harvard Business Review", "https://hbr.org/2023/07/how-to-make-generative-ai-greener"),
        ("How much water does AI consume? OECD", "https://oecd.ai/en/wonk/how-much-water-does-ai-consume"),
        ("CO2 Emissions, International Energy Agency", "https://www.iea.org/commentaries/the-world-s-top-1-of-emitters-produce-over-1000-times-more-co2-than-the-bottom-1"),
        ("9 ways AI is helping tackle climate change", "https://www.weforum.org/stories/2024/02/ai-combat-climate-change/")
        ]

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("    Track your AI carbon footprint")
                    .font(.title3)
                    .bold()
                    .padding(.top, 60)
                
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(sources1, id: \.url) { source in
                            Link(destination: URL(string: source.url)!) {
                                HStack(alignment: .top) {
                                    Text("•")
                                        .font(.body)
                                    Text(source.name)
                                        .font(.body)
                                        .foregroundColor(.blue)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                Text("    Sources Used")
                    .font(.title3)
                    .bold()
                
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(sources2, id: \.url) { source in
                            Link(destination: URL(string: source.url)!) {
                                HStack(alignment: .top) {
                                    Text("•")
                                        .font(.body)
                                    Text(source.name)
                                        .font(.body)
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                                
                Spacer()
                
                HStack {
                    Text("Created with ")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Image(systemName: "heart.fill")
                        .foregroundColor(Color(red: 1.0, green: 0.820, blue: 0.843))
                    Text(" by Gabrielle Gervacio")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
            }
            .scrollContentBackground(.hidden)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {Color(red: 1.0, green: 0.984, blue: 0.953).ignoresSafeArea()}
        }
    }
}

#Preview {
    LearnmoreView()
}
