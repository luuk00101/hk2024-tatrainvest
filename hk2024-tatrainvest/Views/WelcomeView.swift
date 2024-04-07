//
//  WelcomeView.swift
//  hk2024-tatrainvest
//
//  Created by Samuel Dobrík on 06/04/2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            VStack (spacing: 20) {
                Text("Welcome to TatraInvest")
                    .bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Select your preferences:")
                    .padding()
            }
            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            .padding()
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
}

#Preview {
    LogInView()
}
