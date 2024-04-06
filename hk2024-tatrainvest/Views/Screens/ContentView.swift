//
//  ContentView.swift
//  hk2024-tatrainvest
//
//  Created by Lukáš Kollárovič on 06/04/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            WelcomeView()
        }
        .padding()
        .background(.blue)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
