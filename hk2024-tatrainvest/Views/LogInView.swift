//
//  LogInView.swift
//  hk2024-tatrainvest
//
//  Created by Samuel Dobrík on 06/04/2024.
//

import SwiftUI

struct LogInView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var showingLoginScreen = false
    
    @State private var isLoggedIn = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
//                Circle()
//                    .scale(1.7)
//                    .foregroundColor(.white.opacity(0.3))
//                Circle()
//                    .scale(1.35)
//                    .foregroundColor(.white)

                VStack {
                    NavigationLink(destination: QuestionView(), isActive: $isLoggedIn) {
                                        EmptyView()
                                    }
                    
                    Image("Tatra-banka-removebg-preview-wide")
                        //.resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                    
                    Text("Welcome to TatraInvest")
                        .font(.largeTitle)
                        .bold()
                        .padding(70)
                        .foregroundColor(.white)
                    
                    StartButton(title: "login") {
                        isLoggedIn = true

                    }
                    
                    StartButton(title: "prihlásiť cez čítačku") {
                        isLoggedIn = true
                    }
//                    .sheet(isPresented: $isShowingNextView) {
//                                    // Present the second view using a sheet when isShowingNextView is true
//                                    SecondView()

                    
                    NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                }
            }.navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
