//
//  QuizView.swift
//  SPADE
//
//  Created by Gabrielle on 11.01.2025.
//

import SwiftUI
import Foundation

struct Question: Identifiable {
    let id = UUID()
    let questionText: String
    let options: [String]
    let correctAnswer: CorrectAnswer
    let explanation: String
    let type: QuestionType
}

enum CorrectAnswer {
    case single(String)
    case multiple([String])
}

enum QuestionType {
    case multipleChoice
    case multipleChoice2
    case stepper
    case slider
    case stepper2
    case stepper4
}

struct MultipleChoiceView: View {
    let question: Question
    @Binding var score: Int
    @Binding var isAnswered: Bool
    @State private var selectedAnswer: String?
    @State private var answerSelected = false
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack{
            ForEach(question.options, id: \.self) { option in
                Button(action: {
                    selectedAnswer = option
                    answerSelected = true
                    switch question.correctAnswer {
                        case .single(let correct):
                            if option == correct {
                                score += 5
                            }
                        case .multiple(let correctAnswers):
                            if correctAnswers.contains(option) {
                                score += 5
                            }
                        }
                        isAnswered = true
                    }) {
                        Text(option)
                            .font(.title3)
                            .font(.system(.title, design: .rounded))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(selectedAnswer == option ? {
                                switch question.correctAnswer {
                                    case .single(let correct):
                                        return option == correct ? Color(UIColor(red: 0x81 / 255.0, green: 0x9F / 255.0, blue: 0x25 / 255.0, alpha: 1.0)) : Color(UIColor(red: 186 / 255.0, green: 67 / 255.0, blue: 83 / 255.0, alpha: 1.0))
                                    case .multiple(let correctAnswers):
                                        return correctAnswers.contains(option) ? Color(UIColor(red: 0x81 / 255.0, green: 0x9F / 255.0, blue: 0x25 / 255.0, alpha: 1.0)) : Color(UIColor(red: 186 / 255.0, green: 67 / 255.0, blue: 0x83 / 255.0, alpha: 1.0))
                                        }
                            }() : Color.clear)
                            .foregroundColor(Color(UIColor(red: 0x4E / 255.0, green: 0x64 / 255.0, blue: 0x30 / 255.0, alpha: 1.0)))
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 1))
                            .cornerRadius(20)
                            .padding(.vertical, 2)
                            .padding(.horizontal, 30)

                    }
                    .disabled(isAnswered)
                }
            }
        }
    }

struct MultipleChoiceView2: View {
    let question: Question
    @Binding var score: Int
    @Binding var isAnswered: Bool
    @State private var selectedAnswer: String?
    @State private var answerSelected = false
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack{
            ForEach(question.options, id: \.self) { option in
                Button(action: {
                    selectedAnswer = option
                    answerSelected = true
                    switch question.correctAnswer {
                        case .single(let correct):
                            if option == correct {
                                score += 5
                            }
                        case .multiple(let correctAnswers):
                            if correctAnswers.contains(option) {
                                score += 5
                            }
                        }
                        isAnswered = true
                    }) {
                        Text(option)
                            .font(.title3)
                            .font(.system(.title, design: .rounded))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(selectedAnswer == option ? {
                                switch question.correctAnswer {
                                    case .single(let correct):
                                        return option == correct ? Color(UIColor(red: 0x81 / 255.0, green: 0x9F / 255.0, blue: 0x25 / 255.0, alpha: 1.0)) : Color(UIColor(red: 186 / 255.0, green: 67 / 255.0, blue: 83 / 255.0, alpha: 1.0))
                                    case .multiple(let correctAnswers):
                                        return correctAnswers.contains(option) ? Color(UIColor(red: 0x81 / 255.0, green: 0x9F / 255.0, blue: 0x25 / 255.0, alpha: 1.0)) : Color(UIColor(red: 186 / 255.0, green: 67 / 255.0, blue: 0x83 / 255.0, alpha: 1.0))
                                        }
                            }() : Color.clear)
                            .foregroundColor(Color(UIColor(red: 0x4E / 255.0, green: 0x64 / 255.0, blue: 0x30 / 255.0, alpha: 1.0)))
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 1))
                            .cornerRadius(20)
                            .padding(.vertical, 2)
                            .padding(.horizontal, 30)

                    }
                    .disabled(isAnswered)
                }
            }
        }
    }

struct StepperView: View {
    @State private var stepperValue:Int = 0
    let correctAnswer: Int
    let explanation: String
    @Binding var isAnswered: Bool
    @Binding var score: Int
    
    let correctColor = Color(UIColor(red: 0x81 / 255.0, green: 0x9F / 255.0, blue: 0x25 / 255.0, alpha: 1.0))
    let incorrectColor = Color(UIColor(red: 0xBA / 255.0, green: 0x43 / 255.0, blue: 0x53 / 255.0, alpha: 1.0))
    let maxSpeedLevel: Int = 10
    
    var body: some View {
        VStack{
            Text("\(stepperValue) kW")
                .font(.title)
                .padding(.top, 10)
            HStack {
                Button(action: {
                    if stepperValue > 0 {
                        stepperValue -= 10
                               }
                    }) {
                Image(systemName: "minus.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor(red: 0xAD / 255.0, green: 0x9F / 255.0, blue: 0x22 / 255.0, alpha: 1.0)))
                        }

                Button(action: {
                    if stepperValue < 500 {
                        stepperValue += 10
                               }
                    }) {
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor(red: 0xAD / 255.0, green: 0x9F / 255.0, blue: 0x22 / 255.0, alpha: 1.0)))
                        }
                    }
                    .padding()
            let speedLevelIndex = min(stepperValue / 10, maxSpeedLevel - 1)
            Image("speedo \(speedLevelIndex + 1)")
                .resizable()
                .scaledToFit()
                .frame(width: 256, height: 144)
                .padding()
            
            if isAnswered {
                Text(stepperValue == correctAnswer ? "Correct!" : "Incorrect.")
                        .foregroundColor(stepperValue == correctAnswer ? correctColor : incorrectColor)
                        .padding(.bottom, -100)
                Button(action: {
                    if let url = URL(string: "https://example.com/article") {
                        UIApplication.shared.open(url)
                    }
                }) {
                        }
                        .padding()
                
                } else {
                    Button("Submit") {
                        isAnswered = true
                        if stepperValue == correctAnswer {
                            score += 5
                        }
                    }
                    .padding()
            }
        }
        .padding()
    }
}

struct StepperView2: View {
   @State private var stepperValue:Int = 0
    let correctAnswer: Int
    let explanation: String
    @Binding var isAnswered: Bool
    @Binding var score: Int
    
    let correctColor = Color(UIColor(red: 0x81 / 255.0, green: 0x9F / 255.0, blue: 0x25 / 255.0, alpha: 1.0))
    let incorrectColor = Color(UIColor(red: 0xBA / 255.0, green: 0x43 / 255.0, blue: 0x53 / 255.0, alpha: 1.0))
    
    var body: some View {
        VStack{
            Text("Give your best guess:")
                .font(.title2)
                .padding()
                .font(.system(.title, design: .rounded))
            Stepper("\(stepperValue) GPUs", value: $stepperValue, in: 0...16000, step:10)
                .padding()
            
            if isAnswered {
                Text(stepperValue == correctAnswer ? "Correct!" : "Incorrect.")
                        .foregroundColor(stepperValue == correctAnswer ? correctColor : incorrectColor)
                        .padding()
                } else {
                    Button("Submit") {
                        isAnswered = true
                        if stepperValue == correctAnswer {
                            score += 5
                        }
                    }
                    .padding()
            }
        }
    }
}

struct StepperView4: View {
   @State private var stepperValue:Int = 0
    let correctAnswer: Int
    let explanation: String
    @Binding var isAnswered: Bool
    @Binding var score: Int
    
    let correctColor = Color(UIColor(red: 0x81 / 255.0, green: 0x9F / 255.0, blue: 0x25 / 255.0, alpha: 1.0))
    let incorrectColor = Color(UIColor(red: 0xBA / 255.0, green: 0x43 / 255.0, blue: 0x53 / 255.0, alpha: 1.0))
    let maxWaterLevel: Int = 10
    
    var body: some View {
        VStack{
            Text("Give your best guess:")
                .font(.title2)
                .padding()
                .font(.system(.title, design: .rounded))
            let waterLevelIndex = min(stepperValue / 50, maxWaterLevel - 1)
            Image("water cup \(waterLevelIndex + 1)")
                .resizable()
                .scaledToFit()
                .frame(width: 320, height: 180)
                .padding()
            Stepper("\(stepperValue) mL", value: $stepperValue, in: 0...500, step:50)
                .padding()
                .font(.system(.title, design: .rounded))
            if isAnswered {
                Text(stepperValue == correctAnswer ? "Correct!" : "Incorrect.")
                        .foregroundColor(stepperValue == correctAnswer ? correctColor : incorrectColor)
                        .padding()
                } else {
                    Button("Submit") {
                        isAnswered = true
                        if stepperValue == correctAnswer {
                            score += 5
                        }
                    }
                    .padding()
            }
        }
    }
}
    
struct SliderView: View {
    @State private var sliderValue: Double = 1000
    let correctAnswer: Float
    let explanation: String
    @Binding var isAnswered: Bool
    @Binding var score: Int
    @State var color: Color = .green
    @State private var feedback: String = ""
    
    let correctColor = Color(UIColor(red: 0x81 / 255.0, green: 0x9F / 255.0, blue: 0x25 / 255.0, alpha: 1.0))
    let incorrectColor = Color(UIColor(red: 0xBA / 255.0, green: 0x43 / 255.0, blue: 0x53 / 255.0, alpha: 1.0))
    
    private var earthCarIndex: Int {
        return min(Int(sliderValue/200),9)
    }
    
    var body: some View {
        VStack {
            Text("Give your best guess:")
                .font(.title2)
                .padding()
                .font(.system(.title, design: .rounded))
            Image("earth car \(earthCarIndex + 1)")
                .resizable()
                .scaledToFit()
                .frame(width: 240, height: 135)
                .padding()
            Text("\(Int(sliderValue)) times")
                .font(.title)
                .foregroundColor(correctColor)
                .font(.system(.title, design: .rounded))
            Slider(
                value: $sliderValue,
                in: 0...2000,
                step:1.0,
                onEditingChanged: { isEditing in
                    color = isEditing ? .gray : correctColor
                    feedback = ""
                }
            )
            .padding()
            
            HStack {
                Text("0")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .font(.system(.title, design: .rounded))
                    .bold()
            
                Spacer()
                Text("2000")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .font(.system(.title, design: .rounded))
                    .bold()
            }
            .padding()
            
            if isAnswered {
                Text(abs(sliderValue - Double(correctAnswer)) < 10 ? "Correct!" : "Incorrect.")
                    .foregroundColor(abs(sliderValue - Double(correctAnswer)) < 10 ? correctColor : incorrectColor)
                    .padding()
            } else {
                Button("Submit") {
                    isAnswered = true
                    if abs(sliderValue - Double(correctAnswer)) < 10 {
                        score += 5
                        feedback = "Great guess!"
                        color = correctColor
                    }
                }
                .padding()
            }
            
            if !feedback.isEmpty {
                Text(feedback)
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .padding()
            }
        }
    }
}
    
struct QuizView: View {
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var isAnswered = false
    @State private var revealQuestion = false
    @State private var revealOptions = false
    
    let questions: [Question] = [
        Question(
            questionText: "Let’s start easy! How do we measure energy?",
            options: ["Watt", "Kelvin", "Volt", "Ampere"],
            correctAnswer: .single("Watt"),
            explanation: "Watt is a unit of power that measures how fast energy is consumed!",
            type: .multipleChoice),
        Question(
            questionText: "Artificial intelligence is rapidly changing the world, but is incredibly energy intensive with its high computational demands. How many kW of energy do AI servers consume per hour?",
            options: [],
            correctAnswer: .single("100"),
            explanation: "AI servers consume up to 100 kW per rack, more than 10 times the energy of traditional racks (7 kW). With the growing demand, electricity demand growth will double by 2026! according to the International Energy Agency.",
            type: .stepper),
        Question(
            questionText: "Advanced AI models like ChatGPT require vast amounts of computing power during the training. How many times more energy did it take to train GPT-3 compared to driving an electric car around the Earth?",
            options: [],
            correctAnswer: .single("1500"),
            explanation: "Training GPT-3 used up 1,287 MWh, the equivalent to driving an electric car around the Earth 1,500 times! This intense computation relies on electricity from power grids powered by fossil fuels. As AI adoption grows, its carbon footprint expands.",
            type: .slider),
        Question(
            questionText: "We use computational resources to determine the energy AI consumes. What is a GPU?",
            options: ["a processing unit that does complex computations", "a processing unit that handles basic tasks", "a short-term memory that holds data"],
            correctAnswer: .single("a processing unit that does complex computations"),
            explanation: "A GPU, short for graphic processing unit, performs multiple calculations at the same time. It excels at handling data-intensive and computationally demanding tasks. Large AI models can involve thousands of GPUs running continuously." ,
            type: .multipleChoice),
        Question(
            questionText: "GPT-4 is currently the most advanced OpenAI system performing with over 78% accuracy. How many GPUs do you think were used to build GPT-4?",
            options: [],
            correctAnswer: .single("16000"),
            explanation: "It took 16000 GPUs amounting to 1 billion dollars to build GPT-4. Training GPT-4 tooks GPUs running for months and consumed 50 GWh, the equivalent to the annual electricity usage of 3600 homes.",
            type: .stepper2),
        Question(
            questionText: "AI servers can get hot and require cooling systems to regulate temperature. 43% of the energy data centers use goes to cooling and power provision systems. How many mL of water do you think 1 ChatGPT conversation uses? ",
            options: [],
            correctAnswer: .single("500"),
            explanation: "ChatGPT gulps up around 500 mL of water every time you ask it between 5-50 questions. Data centers at Google used up an average of 2.1 million liters of water per day over the past year. (add graph)",
            type: .stepper4),
        Question(
            questionText: "Big companies have made pledges to sustainability in AI. Google aims to solely rely on carbon-free energy by 2030. Microsoft plans to be carbon-negative by 2030 and then remove historical emissions by 2050. How can we make AI systems greener?",
            options: ["renewable energy", "carbon capture", "better climate policies", "circular economy" ],
            correctAnswer: .multiple(["renewable energy", "carbon capture", "better climate policies", "circular economy" ]),
            explanation: "all of the above!",
            type: .multipleChoice2),
        Question(
            questionText: "AI has the potential to help fight climate change. ",
            options: ["Develop smarter technology", "Better climate policies", "Recycling and reusing electronic hardware", "All of the above"],
            correctAnswer: .single("All of the above"),
            explanation: "We can improve AI efficiency to reduce waste and its energy needs with these potential solutions and more! Like small language models, specialized AI Accelerator Chips, and low-power algorithms." ,
            type: .multipleChoice),
    ]
    
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.984, blue: 0.953)
                .ignoresSafeArea()
        ScrollView {
            VStack(spacing: 0) {
                VStack {
                    HStack {
                        Spacer()
                        Image("spadeicon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("\(score)")
                            .font(.system(size: 18, weight: .bold))
                            .padding(10)
                            .padding(.leading, -5)
                            .padding(.trailing, 7)
                    }
                    .padding([.top, .trailing])
                    
                    if currentQuestionIndex < questions.count {
                        let question = questions[currentQuestionIndex]
                        Text(question.questionText)
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.bold)
                            .padding(25)
                            .opacity(revealQuestion ? 1 : 0)
                            .scaleEffect(revealQuestion ? 1 : 0.8)
                            .animation(.easeInOut(duration: 2), value: revealQuestion)
                            .transition(.slide)
                            .onAppear{
                                revealQuestion = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    revealOptions = true
                                }
                            }
                        
                        switch question.type {
                        case .multipleChoice:
                            MultipleChoiceView(question: question, score: $score, isAnswered: $isAnswered)
                                .opacity(revealOptions ? 1 : 0)
                                .animation(.easeInOut(duration: 2), value: revealOptions)
                            
                        case .multipleChoice2:
                            MultipleChoiceView(question: question, score: $score, isAnswered: $isAnswered)
                                .opacity(revealOptions ? 1 : 0)
                                .animation(.easeInOut(duration: 2), value: revealOptions)
                            
                        case .stepper:
                            StepperView(correctAnswer: 100, explanation: question.explanation, isAnswered: $isAnswered, score: $score)
                                .opacity(revealOptions ? 1 : 0)
                                .animation(.easeInOut(duration: 2), value: revealOptions)
                            
                        case .slider:
                            SliderView(correctAnswer: 1500, explanation: question.explanation, isAnswered: $isAnswered, score: $score)
                                .opacity(revealOptions ? 1 : 0)
                                .animation(.easeInOut(duration: 2), value: revealOptions)
                            
                        case .stepper2:
                            StepperView2(correctAnswer: 16000, explanation: question.explanation, isAnswered: $isAnswered, score: $score)
                                .opacity(revealOptions ? 1 : 0)
                                .animation(.easeInOut(duration: 2), value: revealOptions)
                            
                        case .stepper4:
                            StepperView4(correctAnswer: 500, explanation: question.explanation, isAnswered: $isAnswered, score: $score)
                                .opacity(revealOptions ? 1 : 0)
                                .animation(.easeInOut(duration: 2), value: revealOptions)
                        }
                        
                        if isAnswered {
                            switch currentQuestionIndex {
                            case 0:
                                Text("Explanation: \(questions[currentQuestionIndex].explanation)")
                                    .padding(25)
                                    .padding(.top, -15)
                                    .font(.custom("Avenir Next Rounded", size: 17))
                                Image("table")
                                    .resizable()
                                    .frame(width: 420, height:240)
                                    .padding(.bottom, 20)
                            case 1:
                                Text("Explanation: \(questions[currentQuestionIndex].explanation)")
                                    .padding(25)
                                    .padding(.top, -15)
                                    .font(.custom("Avenir Next Rounded", size: 17))
                                Image("table")
                                    .resizable()
                                    .frame(width: 420, height:240)
                                    .padding(.bottom, 20)
                            default:
                                Text("Explanation: \(questions[currentQuestionIndex].explanation)")
                                    .padding(25)
                                    .font(.custom("Avenir Next Rounded", size: 17))
                            }
                            
                            Button("Next Question") {
                                withAnimation(.easeInOut(duration:1)) {
                                    currentQuestionIndex += 1
                                    isAnswered = false
                                    revealQuestion = false
                                    revealOptions = false
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {withAnimation(.easeInOut(duration: 2)) {
                                        revealQuestion = true
                                    }
                                        withAnimation(.easeInOut(duration: 2)){
                                            revealOptions = true
                                        }
                                    }
                                }
                            }
                            .font(.system(size: 17, weight: .bold))
                            .buttonStyle(.borderedProminent)
                            .cornerRadius(15)
                            .foregroundColor(Color(UIColor(red: 0xFC / 255.0, green: 0xFA / 255.0, blue: 0xE2 / 255.0, alpha: 1.0)))
                            .tint(Color(UIColor(red: 0x4E / 255.0, green: 0x64 / 255.0, blue: 0x30 / 255.0, alpha: 1.0)))
                        }
                    } else {
                        EndingScreen(score: score,totalQuestions: questions.count)
                    }
                }
                .padding([.leading, .trailing], 0)
            }
            .environment(\.font, .system(.body, design: .rounded))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
    
    struct EndingScreen: View {
        @Environment(\.presentationMode) var presentationMode
        let score: Int
        let totalQuestions: Int
        
        var body: some View {
            VStack {
                Text("Quiz Completed!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Text("You earned \(score) knowledge points!")
                    .font(.title)
                    .padding()
                Text("Now that you know how AI affects our world, it’s up to you to make smarter, greener choices.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                ShareLink(item: URL(string: "https://developer.apple.com/xcode/swiftui/")!) {
                    Label("Share your results", systemImage: "square.and.arrow.up")
                }
                .padding()
                
                Button("Back to Home") {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
        }
    }
                 

#Preview {
    QuizView()
}
