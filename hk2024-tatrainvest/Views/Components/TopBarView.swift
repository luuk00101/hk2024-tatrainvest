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
            Image("Tatra-banka-removebg-preview")
                            .resizable() // Allows the image to be resized
                            .aspectRatio(contentMode: .fit) // Ensures the content is scaled to fit the frame
                            .frame(width: 50, height: 50) // Adjust the width and height as needed
            
            Spacer()
                .frame(width: 80)
            
            Button(action: {
                // Action for tapping on the portfolio balance
            }) {
                Text("$12,345.67") // Example balance
                    .foregroundColor(.white)
                    .bold()
            }
            
            Spacer()
        }
        .padding()
        .background(Color.black)
    }
}


