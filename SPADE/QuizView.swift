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
    case slider2
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
                .font(.largeTitle)
                .bold()
                .padding(.top, 10)
                .foregroundColor(correctColor)
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
            Text("\(stepperValue)")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 5)
                .foregroundColor(correctColor)
            HStack {
                Button(action: {
                    if stepperValue > 0 {
                        stepperValue -= 1000
                               }
                    }) {
                Image(systemName: "minus.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor(red: 0xAD / 255.0, green: 0x9F / 255.0, blue: 0x22 / 255.0, alpha: 1.0)))
                        }

                Button(action: {
                    if stepperValue < 16000 {
                        stepperValue += 1000
                               }
                    }) {
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor(red: 0xAD / 255.0, green: 0x9F / 255.0, blue: 0x22 / 255.0, alpha: 1.0)))
                        }
                    }
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
            Text("\(stepperValue) mL")
                .padding()
                .font(.largeTitle)
                .bold()
                .foregroundColor(correctColor)
            
            HStack {
                Button(action: {
                    if stepperValue > 0 {
                        stepperValue -= 50
                               }
                    }) {
                Image(systemName: "minus.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor(red: 0xAD / 255.0, green: 0x9F / 255.0, blue: 0x22 / 255.0, alpha: 1.0)))
                        }

                Button(action: {
                    if stepperValue < 1000 {
                        stepperValue += 50
                               }
                    }) {
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor(red: 0xAD / 255.0, green: 0x9F / 255.0, blue: 0x22 / 255.0, alpha: 1.0)))
                        }
                    }
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
    
struct SliderView: View {
    @State private var sliderValue: Double = 0
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
                .frame(width: 300, height: 135)
                .padding()
            Text("\(Int(sliderValue)) times")
                .font(.largeTitle)
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

struct SliderView2: View {
    @State private var sliderValue: Double = 0
    let correctAnswer: Float
    let explanation: String
    @Binding var isAnswered: Bool
    @Binding var score: Int
    @State var color: Color = .green
    @State private var feedback: String = ""
    
    let correctColor = Color(UIColor(red: 0x81 / 255.0, green: 0x9F / 255.0, blue: 0x25 / 255.0, alpha: 1.0))
    let incorrectColor = Color(UIColor(red: 0xBA / 255.0, green: 0x43 / 255.0, blue: 0x53 / 255.0, alpha: 1.0))
    
    var body: some View {
        VStack {
            Text("\(Int(sliderValue)) tons of CO2")
                .font(.largeTitle)
                .foregroundColor(correctColor)
                .font(.system(.title, design: .rounded))
            Slider(
                value: $sliderValue,
                in: 0...500,
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
                Text("500")
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
            questionText: "Artificial intelligence (AI) is rapidly changing the world. How many kW of energy do AI servers consume per hour?",
            options: [],
            correctAnswer: .single("100"),
            explanation: "AI servers are computers hosted in data centers for storing, processing and distributing data. They consume up to 100 kW per rack, more than 10 times the energy of traditional racks (7 kW)!",
            type: .stepper),
        Question(
            questionText: "How many times more energy did it take to train GPT-3 compared to driving an electric car around the Earth?",
            options: [],
            correctAnswer: .single("1500"),
            explanation: "Advanced AI models like ChatGPT require vast amounts of computing power during the training. Training GPT-3 used up 1,287 MWh, the equivalent to driving an electric car around the Earth 1,500 times!",
            type: .slider),
        Question(
            questionText: "Behind AI is an important piece of hardware, a GPU, which is a...",
            options: ["specialized electronic circuit that does complex computations", "processing unit that acts as a control center", "short-term memory that holds data"],
            correctAnswer: .single("specialized electronic circuit that does complex computations"),
            explanation: "GPUs, short for graphic processing unit, excel at handling data-intensive tasks. These require 10–15 times the energy a traditional CPU. Large AI models can involve thousands of GPUs running continuously." ,
            type: .multipleChoice),
        Question(
            questionText: "How many GPUs do you think were used to build GPT-4, currently the most advanced and accurate OpenAI system?",
            options: [],
            correctAnswer: .single("16000"),
            explanation: "It took 16000 GPUs amounting to 1 billion dollars to build GPT-4. Training GPT-4 tooks GPUs running for months and consumed 50 GWh, the equivalent to the annual electricity usage of 3600 homes.",
            type: .stepper2),
        Question(
            questionText: "Researchers have argued that training a single large language deep learning model is estimated to use around...",
            options: [],
            correctAnswer: .single("300"),
            explanation: "Large language deep learning models such as OpenAI’s GPT-4 or Google’s PaLM is estimated to use around 300 tons of CO2 — for comparison, the average person is responsible for creating around 5 tons of CO2 a year.",
            type: .slider2),
        Question(
            questionText: "AI servers can get hot and require cooling systems to regulate temperature. How many mL of water do you think 1 ChatGPT conversation uses? ",
            options: [],
            correctAnswer: .single("500"),
            explanation: "ChatGPT gulps up around 500 mL of water every time you ask it between 5-50 questions! AI consumes fresh water by onsite server cooling and offsite electricity generation.",
            type: .stepper4),
        Question(
            questionText: "Is AI bad for the environment?",
            options: ["Yes", "No"],
            correctAnswer: .single("No"),
            explanation: "Although AI has environmental complications, it also has the power to contribute to the fight against climate change, whether it be mapping deforestation, improving satellite imagery, predicting weather patterns, recycling waste, and more.",
            type: .multipleChoice),
        Question(
            questionText: "How can we make AI systems greener?",
            options: ["Renewable energy", "Effective AI models", "Better climate policies", "Circular economy"],
            correctAnswer: .multiple(["Renewable energy", "Effective AI models", "Better climate policies", "Circular economy"]),
            explanation: "All of the above!",
            type: .multipleChoice2),
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
                            .padding(.trailing, 10)
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
                        case .slider2:
                            SliderView2(correctAnswer: 300, explanation: question.explanation, isAnswered: $isAnswered, score: $score)
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
                                    .font(.custom("Poppins-Regular", size: 17))
                                Image("table")
                                    .resizable()
                                    .frame(width: 420, height:240)
                                    .padding(.bottom, 20)
                            case 1:
                                Text("Explanation: \(questions[currentQuestionIndex].explanation)")
                                    .padding(25)
                                    .padding(.top, -15)
                                    .font(.custom("Poppins-Regular", size: 17))
                                ZStack {
                                    Image("datagraph")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 300)
                                        .padding(.bottom, 20)
                                                
                                    Link(destination: URL(string: "https://www2.deloitte.com/us/en/insights/industry/technology/technology-media-and-telecom-predictions/2025/genai-power-consumption-creates-need-for-more-sustainable-data-centers.html")!) {
                                        Text("?")
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .frame(width: 40, height: 40)
                                            .background(Circle().fill(Color.blue))
                                            .offset(x: 130, y: -120)
                                            }
                                    }
                            case 4:
                                Text("Explanation: \(questions[currentQuestionIndex].explanation)")
                                    .padding(25)
                                    .padding(.top, -15)
                                    .font(.custom("Poppins-Regular", size: 17))
                                ZStack {
                                    Image("gpus")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 300)
                                        .padding(.bottom, 20)
                                                
                                    Link(destination: URL(string: "https://cloud.google.com/discover/gpu-for-ai")!) {
                                        Text("?")
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .frame(width: 40, height: 40)
                                            .background(Circle().fill(Color.blue))
                                            .offset(x: 140, y: -100)
                                            }
                                    }
                            case 6:
                                Text("Explanation: \(questions[currentQuestionIndex].explanation)")
                                    .padding(25)
                                    .padding(.top, -15)
                                    .font(.custom("Poppins-Regular", size: 17))
                                ZStack {
                                    Image("cooling")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 300)
                                        .padding(.bottom, 20)
                                    Link(destination: URL(string: "https://oecd.ai/en/wonk/how-much-water-does-ai-consume")!) {
                                        Text("?")
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .frame(width: 40, height: 40)
                                            .background(Circle().fill(Color.blue))
                                            .offset(x: 130, y: -90)
                                            }
                                    }
                            case 7:
                                Text("Explanation: \(questions[currentQuestionIndex].explanation)")
                                    .padding(25)
                                    .padding(.top, -15)
                                    .font(.custom("Poppins-Regular", size: 17))
                                ZStack {
                                    Image("climatechange")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 350)
                                        .padding(.bottom, 20)
                                    Link(destination: URL(string: "https://www.weforum.org/stories/2024/02/ai-combat-climate-change/")!) {
                                        Text("?")
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .frame(width: 40, height: 40)
                                            .background(Circle().fill(Color.blue))
                                            .offset(x: 150, y: -90)
                                            }
                                    }
    
                            default:
                                Text("Explanation: \(questions[currentQuestionIndex].explanation)")
                                    .padding(25)
                                    .font(.custom("Poppins-Regular", size: 17))
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
                            .ignoresSafeArea()
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
            Spacer()
            Image("completed")
                .resizable()
                .scaledToFit()
                .frame(width: 350)
                .padding(.bottom, 20)
            Text("You earned \(score) knowledge points!")
                .font(.custom("Poppins-Regular", size: 20))
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
            ShareLink(item: URL(string: "https://developer.apple.com/xcode/swiftui/")!) {
                Label("Share your results", systemImage: "square.and.arrow.up")
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("BACK TO HOME")
                    .font(.system(size: 20, weight: .bold))
            }
            .buttonStyle(.borderedProminent)
            .cornerRadius(15)
            .foregroundColor(Color(UIColor(red: 0xFC / 255.0, green: 0xFA / 255.0, blue: 0xE2 / 255.0, alpha: 1.0)))
            .tint(Color(UIColor(red: 0x4E / 255.0, green: 0x64 / 255.0, blue: 0x30 / 255.0, alpha: 1.0)))
            Spacer()
        }
        .padding()
    }
}
                 

#Preview {
    QuizView()
}
