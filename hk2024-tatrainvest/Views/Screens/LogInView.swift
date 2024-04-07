//
//  LogInView.swift
//  hk2024-tatrainvest
//
//  Created by Samuel Dobrík on 06/04/2024.
//

import SwiftUI

struct LogInView: View {
    @State private var showingLoginScreen = false
    
    @State private var isLoggedIn = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()

                VStack {
                    NavigationLink(destination: QuestionView(), isActive: $isLoggedIn) {
                                        EmptyView()
                                    }
                    
                    Image("Tatra-banka-removebg-preview-wide")
                        //.resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                    
                    Text("TatraInvest")
                        .font(.largeTitle)
                        .bold()
                        .padding(70)
                        .foregroundColor(.white)
                    
                    //StartButton(title: "login") {
                        //isLoggedIn = true
                    //}
                    
                    StartButton(title: "prihlásiť cez čítačku") {
                        isLoggedIn = true
                    }
//                    .sheet(isPresented: $isShowingNextView) {
//                                    // Present the second view using a sheet when isShowingNextView is true
//                                    SecondView()

                }
            }
        }.navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

#Preview {
    LogInView()
}
