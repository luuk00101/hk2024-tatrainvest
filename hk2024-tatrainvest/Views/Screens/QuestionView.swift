//
//  QuestionView.swift
//  hk2024-tatrainvest
//
//  Created by Samuel Dobrík on 06/04/2024.
//

import SwiftUI

struct QuestionView: View {
    @State private var showingLoginScreen = false
    
    @State private var qCount = 0
    @State private var shouldNavigateToLogin = false
    @State private var shouldNavigateToDash = false
    private var bCount = 0
    @State var progress1: Double = 0
    
    @State private var isTextVisible = true // Initial visibility state
    @State private var isTextVisible2 = true // Initial visibility state
    
        /*
         questions manager
         */
    struct Question {
        let text: String
        let buttons: [String]
        @State var choice: Int = 0 // Property to store the selected answer
        let withSlider: Bool
    }

    var questionsB: [Question] = [
        Question(text: "Máš už skúsenosti s investovaním?", buttons: ["Pravidelne investujem", "Už som v minulosti investoval", "Nemám skúsenosti"], choice: -1, withSlider: false),
        Question(text: "Si členom správnej rady / shareholder vo verejne obchodovanej firme?", buttons: ["Áno", "Nie"], choice: -1, withSlider: false),
        Question(text: "Si politicky exponovaná osoba?", buttons: ["Áno", "Nie"], choice: -1, withSlider: false),
        Question(text: "Si si vedomý rizika spojeným s investovaním?", buttons: ["Áno", "Nie"], choice: -1, withSlider: false),
        Question(text: "Akú investičnú stratégiu preferuješ?", buttons: ["OK"], choice: -1, withSlider: true),
        Question(text: "Ako často chceš byť informovaný?", buttons: ["Denne", "Týždenne", "Mesačne"], choice: -1, withSlider: false),
        Question(text: "Akú sumu by si chcel mesačne investovať?", buttons: ["OK"], choice: -1, withSlider: true)
    ]
    
    var body: some View {
        NavigationView {
            ZStack () {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    
                    if isTextVisible {
                        Text("Pred začatím si musíme spraviť len krátku registráciu...")
                            .font(.system(size: 21))
                            .bold()
                            .padding(30)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .lineSpacing(15)
                            .onTapGesture {
                                // Toggle the visibility state on tap
                                isTextVisible.toggle()
                            }
                    } else {
                        // Placeholder view when text is hidden
                        Color.clear.frame(height: 0)
                    if isTextVisible2 {
                            // Placeholder view when text is hidden
                            Color.clear.frame(height: 0)
                            
                            Text("Poďme na to! 🚀")
                                .font(.system(size: 22))
                                .bold()
                                .padding(50)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .lineSpacing(15)
                                .onTapGesture {
                                    // Toggle the visibility state on tap
                                    isTextVisible2.toggle()
                                }
                        } else {
                            // Placeholder view when text is hidden
                            Color.clear.frame(height: 0)
                            
                            // heading
                            Text(questionsB[qCount].text)
                            //.font(.title)
                                .font(.system(size: 25))
                                .bold()
                                .padding(30)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .lineSpacing(15)
                            
                            
                            // buttons
                            ForEach(questionsB[qCount].buttons, id: \.self) { buttonTitle in
                                if (questionsB[qCount].text == "Akú investičnú stratégiu preferuješ?") {
                                    SliderView(leftText: "Dynamická", rightText: "Konzervatívna")
                                }
                                if (questionsB[qCount].text == "Akú sumu by si chcel mesačne investovať?") {
                                    SliderView(leftText: "1000 €", rightText: "35 €")
                                }
                                SurveyButton(title: buttonTitle) {
                                    nextQuestion()
                                }
                            }
                            
                            NavigationLink(destination: LogInView(), isActive: $shouldNavigateToLogin) {
                                EmptyView()
                            }
                            NavigationLink(destination: DashboardView(), isActive: $shouldNavigateToDash) {
                                EmptyView()
                            }
                            .toolbar {
                                ToolbarItem(placement: .navigationBarLeading) {
                                    Button(action: previousQuestion) {
                                        VStack {
                                            HStack {
                                                Image(systemName: "chevron.left")
                                                    .foregroundColor(.white)
                                                Text("Back")
                                                    .foregroundColor(.white)
                                                    .font(.headline)
                                            }
                                            .padding()
                                            .background(Color.black)
                                            .cornerRadius(5)
                                            //ProgressBar(progress: progress1)
                                        }
                                        // left a progress
                                    }
                                }
                            }
                        }
                        }
                    }
                }
        }.navigationBarHidden(true)
        
    
        //            .transition(.opacity) // Apply opacity transition animation
        //            .animation(.easeInOut) // Set animation type
            .animation(.easeOut)
    }
    
    func nextQuestion() {
        progress1 = 350 * CGFloat(qCount) / CGFloat(questionsB.count - 1)
        if (qCount < questionsB.count - 1) {
            qCount = qCount + 1
        } else {
            shouldNavigateToDash = true;
        }
    }
    func previousQuestion() {
        if (qCount > 0) {
            qCount = qCount - 1
        } else {
            shouldNavigateToLogin = true;
        }
    }
}
    
    struct QuestionView_Previews: PreviewProvider {
        static var previews: some View {
            QuestionView()
        }
    }

#Preview {
    QuestionView()
}
