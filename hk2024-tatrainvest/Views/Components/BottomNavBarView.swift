//
//  BottomNavBarView.swift
//  hk2024-tatrainvest
//
//  Created by Lukáš Kollárovič on 06/04/2024.
//

import SwiftUI

struct BottomNavBarView: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "house.fill") // Home icon
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "chart.bar.fill") // Stats icon
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "newspaper.fill") // News icon
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "person.fill") // Profile icon
                .foregroundColor(.white)
            Spacer()
        }
        .padding()
        .background(Color.black)
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom) // Add padding on bottom
    }
}
