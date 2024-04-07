//
//  DashboardView.swift
//  hk2024-tatrainvest
//
//  Created by Lukáš Kollárovič on 06/04/2024.
//

import SwiftUI

enum CurrentScreen {
    case home, stats, game, news, profile
}

struct DashboardView: View {
    @State private var currentScreen = CurrentScreen.home
    
    var body: some View {
        VStack {
            TopBarView()
            if currentScreen == .home {
                Button(action: { currentScreen = CurrentScreen.stats
                                        }) {
                                            Image("main-report")
                                        }
                            DiscussView()
            }
            if currentScreen == .stats {
                Image("stats")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
            }
            
            if currentScreen == .game {
                
            }
            
            BottomNavBarView(currentScreen: $currentScreen)
        }
        .background(Color.black)
    }
}

#Preview {
    DashboardView()
}
