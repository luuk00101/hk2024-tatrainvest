//
//  QuestionView.swift
//  hk2024-tatrainvest
//
//  Created by Samuel Dobrík on 06/04/2024.
//

import SwiftUI

struct QuestionView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var showingLoginScreen = false
    
    @State private var qCount = 0
    @State private var shouldNavigateToLogin = false
    private var bCount = 0
    
        /*
         questions manager
         */
    struct Question {
        let text: String
        let buttons: [String]
        @State var choice: Int // Property to store the selected answer
    }

    var questionsB: [Question] = [
        Question(text: "Máš už skúsenosti s investovaním?", buttons: ["Pravidelne investujem", "Už som v minulosti investoval", "Nemám skúsenosti"], choice: -1),
        Question(text: "Si členom správnej rady / shareholder vo verejne obchodovanej firme", buttons: ["Áno", "Nie"], choice: -1),
        Question(text: "Si politicky exponovaná osoba?", buttons: ["Áno", "Nie"], choice: -1),
        Question(text: "Si si vedomý rizika spojeným s investovaním?", buttons: ["Áno", "Nie"], choice: -1),
        Question(text: "Akú investičnú stratégiu preferuješ?", buttons: ["slider"], choice: -1),
        Question(text: "Ako často chceš byť informovaný", buttons: ["Denne", "Týždenne", "Mesačne"], choice: -1),
        Question(text: "Akú sumu by si chcel mesačne investovať?", buttons: ["slider"], choice: -1)
    ]
    
    var body: some View {
        NavigationView {
            ZStack () {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    //Spacer()
                    
                    // heading
                    Text(questionsB[qCount].text)
                    //.font(.title)
                        .font(.system(size: 28))
                        .bold()
                        .padding(50)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineSpacing(15)
                    
                    // buttons
                    ForEach(questionsB[qCount].buttons, id: \.self) { buttonTitle in
                        SurveyButton(title: buttonTitle) {
                            nextQuestion()
                        }
                    }
                    
                    NavigationLink(destination: LogInView(), isActive: $shouldNavigateToLogin) {
                        EmptyView()
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: previousQuestion) {
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
        if (qCount < questionsB.count - 1) {
            qCount = qCount + 1
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
