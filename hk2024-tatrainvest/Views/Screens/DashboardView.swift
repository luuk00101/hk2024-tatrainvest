//
//  DashboardView.swift
//  hk2024-tatrainvest
//
//  Created by Lukáš Kollárovič on 06/04/2024.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack {
            TopBarView()
            ChatWindowView()
            BottomNavBarView()
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all) // Extend the black background to screen edges
    }
}

#Preview {
    DashboardView()
}
