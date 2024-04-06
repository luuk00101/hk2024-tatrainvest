//
//  TopBarView.swift
//  hk2024-tatrainvest
//
//  Created by Lukáš Kollárovič on 06/04/2024.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        HStack {
            Image("logo") // Assume you have a logo image set in your assets
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
            
            Spacer()
            
            Button(action: {
                // Action for tapping on the portfolio balance
            }) {
                Text("$12,345.67") // Example balance
                    .foregroundColor(.white)
                    .bold()
            }
            
            Spacer()
            
            Button(action: {
                // Action for tapping on the notification bell
            }) {
                Image(systemName: "bell.fill")
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.black)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top) // Add padding on top
    }
}


