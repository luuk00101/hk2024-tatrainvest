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
                
//                Image("tatra_banka_member_black")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)

                VStack {
                    Text("Welcome to TatraInvest")
                        .font(.largeTitle)
                        .bold()
                        .padding(70)
                        .foregroundColor(.white)
                                        
                    Button("Login") {
                        authenticateUser(username: username, password: password)
                        }
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .cornerRadius(0)
                    
                    NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                }
            }.navigationBarHidden(true)
        }
    }
    
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "mario2021" {
            wrongUsername = 0
            if password.lowercased() == "abc123" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
