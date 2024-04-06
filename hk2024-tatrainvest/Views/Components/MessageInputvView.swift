//
//  MessageInputvView.swift
//  hk2024-tatrainvest
//
//  Created by Lukáš Kollárovič on 06/04/2024.
//

import SwiftUI

struct MessageInputView: View {
    @State private var messageText: String = ""

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    TextField("Message...", text: $messageText)
                        .padding(8)
                        .background(Color(.systemGray6)) // Light gray color
                        .cornerRadius(20)
                        .frame(height: 40) // Fixed height for the TextField
                        .padding(.leading, 10)

                    Button(action: {
                        // Implement sending message
                    }) {
                        Image(systemName: "arrow.up.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32) // Smaller frame for the button
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing, 10)
                }
                .frame(maxWidth: .infinity)
                .background(Color.black)
                // This will lift the view above the home indicator
                .padding(.bottom, geometry.safeAreaInsets.bottom == 0 ? 8 : geometry.safeAreaInsets.bottom)
            }
        }
        .frame(height: 55) // Fixed total height for the message bar
    }
}

