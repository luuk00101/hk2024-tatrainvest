//
//  BottomNavBarView.swift
//  hk2024-tatrainvest
//
//  Created by Lukáš Kollárovič on 06/04/2024.
//

import SwiftUI

struct BottomNavBarView: View {
    @Binding var currentScreen: CurrentScreen

    let highlightColor = Color(red: 1/255, green: 142/255, blue: 237/255, opacity: 1.0)

    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                self.currentScreen = .home
            }) {
                Image(systemName: "house.fill")
                    .foregroundColor(currentScreen == .home ? highlightColor : .white)
            }
            Spacer()
            Button(action: {
                self.currentScreen = .stats
            }) {
                Image(systemName: "chart.bar.fill")
                    .foregroundColor(currentScreen == .stats ? highlightColor : .white)
            }
            Spacer()
            Button(action: {
                            //self.currentScreen = .game
                        }) {
                            Image(systemName: "gamecontroller.fill")
                                .foregroundColor(currentScreen == .game ? highlightColor : .white)
                        }
                        Spacer()
            Button(action: {
                //self.currentScreen = .news
            }) {
                Image(systemName: "newspaper.fill")
                    .foregroundColor(currentScreen == .news ? highlightColor : .white)
            }
            Spacer()
            Button(action: {
                //self.currentScreen = .profile
            }) {
                Image(systemName: "person.fill")
                    .foregroundColor(currentScreen == .profile ? highlightColor : .white)
            }
            Spacer()
        }
        .padding()
        .background(Color("DarkGray"))
    }
}

