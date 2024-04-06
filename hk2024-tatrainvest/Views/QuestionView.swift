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
    
    private let questions = ["Máš už skúsenosti s investovaním?",
                             "Si členom správnej rady / shareholder vo verejne obchodovanej firme",
                             "Si politicky exponovaná osoba?",
                             "Si si vedomý rizika spojeným s investovaním?",
                             "Akú investičnú stratégiu preferuješ?",
                             "Ako často chceš byť informovaný",
                             "Akú sumu by si chcel mesačne investovať?"]
    private let buttons = [["Pravidelne investujem",
                            "Už som v minulosti investoval",
                            "Nemám skúsenosti"]
                           ,["Áno","Nie"],
                           ["Áno","Nie"],
                           ["Áno","Nie"],
                           ["slider"],
                           ["Denne","Týždenne","Mesačne"],
                           ["slider"]]
    @State private var qCount = 0
    private var bCount = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    
                    //Spacer()
                    
//                    Button(action: previousQuestion) {
//                                HStack {
//                                    Text("")
//                                        .foregroundColor(.black)
//                                        .font(.headline)
//                                    Image(systemName: "chevron.left")
//                                        .foregroundColor(.black)
//                                }
//                                .padding()
//                                .background(Color.white)
//                                .cornerRadius(10)
//                            }

                    
                    // heading
                    Text(questions[qCount])
                    //.font(.title)
                        .font(.system(size: 28))
                        .bold()
                        .padding(50)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineSpacing(15)
                    
                    
                    // buttons
                    ForEach(buttons[qCount], id: \.self) { buttonTitle in
                        SurveyButton(title: buttonTitle) {
                            nextQuestion()
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
        if (qCount < questions.count - 1) {
            qCount = qCount + 1
        }
    }
    func previousQuestion() {
        if (qCount > 0) {
            qCount = qCount - 1
        }
    }
    
    struct QuestionView_Previews: PreviewProvider {
        static var previews: some View {
            QuestionView()
        }
    }
    
    ///*
    // questions manager
    // */
    //struct Question {
    //    let text: String
    //    let buttons: [String]
    //}
    //
    //let questionsWithButtons: [Question] = [
    //    Question(text: "Máš už skúsenosti s investovaním?", buttons: ["Pravidelne investujem", "Už som v minulosti investoval", "a"]),
    //    Question(text: "Banana", buttons: ["a", "b"]),
    //    Question(text: "Orange", buttons: ["a", "b"]),
    //    Question(text: "Grapes", buttons: ["a", "b"])
    //]
}
