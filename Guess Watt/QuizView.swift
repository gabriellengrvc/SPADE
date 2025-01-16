//
//  QuizView.swift
//  Guess Watt
//
//  Created by Gabrielle on 11.01.2025.
//

import SwiftUI
import Foundation

struct Question: Identifiable {
    let id = UUID()
    let questionText: String
    let options: [String]
    let correctAnswer: String
    let explanation: String
    let type: QuestionType
}

enum QuestionType {
    case multipleChoice
    case stepper
    case slider
    case stepper2
    case stepper3
    case stepper4
}

struct MultipleChoiceView: View {
    let question: Question
    @Binding var score: Int
    @Binding var isAnswered: Bool
    @State private var selectedAnswer: String?
    @State private var answerSelected = false
    
    var body: some View {
        VStack{
            ForEach(question.options, id: \.self) { option in
                Button(action: {
                    selectedAnswer = option
                    answerSelected = true
                    if option == question.correctAnswer {
                        score += 5
                        }
                        isAnswered = true
                    }) {
                        Text(option)
                            .font(.title3)
                            .font(.system(.title, design: .rounded))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(selectedAnswer == option ? (option == question.correctAnswer ? Color(UIColor(red: 0x81 / 255.0, green: 0x9F / 255.0, blue: 0x25 / 255.0, alpha: 1.0)) : Color(UIColor(red: 186 / 255.0, green: 67 / 255.0, blue: 83 / 255.0, alpha: 1.0))) : Color.clear)
                            .foregroundColor(Color(UIColor(red: 0x4E / 255.0, green: 0x64 / 255.0, blue: 0x30 / 255.0, alpha: 1.0)))
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 1))
                            .cornerRadius(20)
                            .padding(.vertical, 2)
                            .padding(.horizontal, 20)

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
    
    var body: some View {
        VStack{
            Text("Give your best guess:")
                .font(.title2)
                .font(.system(.title, design: .rounded))
                .padding()
            Stepper("\(stepperValue) kW", value: $stepperValue, in: 0...16000, step:10)
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

struct StepperView3: View {
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
            Stepper("\(stepperValue) GwH", value: $stepperValue, in: 0...16000, step:10)
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
            correctAnswer: "Watt",
            explanation: "Watt is a unit of power that measures how fast energy is consumed, watts are used for individual devices, kilowatts power multiple big appliances like a data center, megawatts power hundreds of homes, gigawatts power entire cities at a national or industrial scale",
            type: .multipleChoice),
        Question(
            questionText: "Compared to traditional servers, AI is much more energy intensive. How many kW of energy can AI servers consume?",
            options: [],
            correctAnswer: "100",
            explanation: "AI servers consume up to 100 kW per rack, more than 10 times the energy of traditional racks (7 kW). Data centers housing these servers are expected to double their electricity consumption by 2030.",
            type: .stepper),
        Question(
            questionText: "Training large language models is energy intensive. How many times more energy did it take to train GPT-3 compared to driving an electric car all around the Earth?",
            options: [],
            correctAnswer: "1500",
            explanation: "Training GPT-3 used up 1,287 MWh, the equivalent to driving an electric car around the Earth 1,500 times.",
            type: .slider),
        Question(
            questionText: "We also use computational resources to determine the energy AI consumes. What is a GPU?",
            options: ["a processing unit that does complex computations", "a processing unit that handles basic tasks", "a short-term memory that holds data"],
            correctAnswer: "a processing unit that does complex computations",
            explanation: "A GPU is a graphic processing units that requires a lot of energy to run. Large AI models require more memory as they process larger data sets. A large AI model can involve thousands of GPUs running continuously!" ,
            type: .multipleChoice),
        Question(
            questionText: "GPT-4 is currently the most advanced OpenAI system and can solve difficult problems with greater accuracy. How many GPUs do you think were used to build GPT-4?",
            options: [],
            correctAnswer: "16000",
            explanation: "It took 16000 GPUs amounting to 1 billion dollars to build GPT-4, the large language model created by OpenAI. Training GPT-4 tooks GPUs running for months.",
            type: .stepper2),
        Question(
            questionText: "How many GwH of energy do you think it took to train GPT-4?",
            options: [],
            correctAnswer: "50",
            explanation: "It took 50 GWh, the equivalent to the annual electricity usage of 3600 homes.",
            type: .stepper3),
        Question(
            questionText: "Did you know that AI consumes water? How many mL of water do you think 1 ChatGPT conversation uses? ",
            options: [],
            correctAnswer: "500",
            explanation: "ChatGPT gulps up around 500 mL of water every time you ask it between 5-50 questions. Google's hyperscale data centers, that power Gmail and Google Drive, used up an average of 2.1 million liters of water per day over the past year.",
            type: .stepper4),
        Question(
            questionText: "Why does AI use so much water?",
            options: ["Cooling", "Electricity generation", "AI supply chains", "All of the above"],
            correctAnswer: "All of the above",
            explanation: "AI’s water usage is due to all of the above! Its significant energy consumption generates a lot of heat which requires cooling. Most common cooling methods depend on substantial quantities of clean, fresh water, a limited resource on our planet." ,
            type: .multipleChoice),
        Question(
            questionText: "Researchers say that AI has the potential to help fight climate change. How can we find a balance and reduce its environmental impact?",
            options: ["Develop smarter technology", "Better climate policies", "Recycling and reusing electronic hardware", "All of the above"],
            correctAnswer: "All of the above",
            explanation: "We can improve AI efficiency to reduce waste and its energy needs with these potential solutions and more! Like small language models, specialized AI Accelerator Chips, and low-power algorithms." ,
            type: .multipleChoice),
    ]
    
    var body: some View {
        VStack {
            if currentQuestionIndex < questions.count {
                let question = questions[currentQuestionIndex]
                Text(question.questionText)
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.bold)
                    .padding(20)
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
                case .stepper:
                    StepperView(correctAnswer: Int(question.correctAnswer) ?? 0, explanation: question.explanation, isAnswered: $isAnswered, score: $score)
                        .opacity(revealOptions ? 1 : 0)
                        .animation(.easeInOut(duration: 2), value: revealOptions)
                    
                case .slider:
                    SliderView(correctAnswer: Float(question.correctAnswer) ?? 0, explanation: question.explanation, isAnswered: $isAnswered, score: $score)
                        .opacity(revealOptions ? 1 : 0)
                        .animation(.easeInOut(duration: 2), value: revealOptions)
                    
                case .stepper2:
                    StepperView2(correctAnswer: Int(question.correctAnswer) ?? 0, explanation: question.explanation, isAnswered: $isAnswered, score: $score)
                        .opacity(revealOptions ? 1 : 0)
                        .animation(.easeInOut(duration: 2), value: revealOptions)
                    
                case .stepper3:
                    StepperView3(correctAnswer: Int(question.correctAnswer) ?? 0, explanation: question.explanation, isAnswered: $isAnswered, score: $score)
                        .opacity(revealOptions ? 1 : 0)
                        .animation(.easeInOut(duration: 2), value: revealOptions)
                    
                case .stepper4:
                    StepperView4(correctAnswer: Int(question.correctAnswer) ?? 0, explanation: question.explanation, isAnswered: $isAnswered, score: $score)
                        .opacity(revealOptions ? 1 : 0)
                        .animation(.easeInOut(duration: 2), value: revealOptions)
                }
                
                if isAnswered {
                    Text("Explanation: \(questions[currentQuestionIndex].explanation)")
                        .padding(25)
                        .font(.custom("Avenir Next Rounded", size: 17))
                    
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
            }
        } else {
            EndingScreen(score: score,totalQuestions: questions.count)
        }
    }
    .environment(\.font, .system(.body, design: .rounded))
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        Color(red: 1.0, green: 0.984, blue: 0.953)
            .ignoresSafeArea()
    }
    .scrollContentBackground(.hidden)
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
}
                 

#Preview {
    QuizView()
}
