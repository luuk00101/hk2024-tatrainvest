//
//  ChatWindowView.swift
//  hk2024-tatrainvest
//
//  Created by Lukáš Kollárovič on 06/04/2024.
//

import SwiftUI

struct ChatWindowView: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 12) {
                    // Replace with your dynamic chat messages
                    ForEach(0..<10, id: \.self) { index in // Example static list
                        HStack {
                            if index % 2 == 0 {
                                Spacer() // Pushes message to the right for a 'response' look
                            }
                            Text("Here's a sample message.")
                                .padding(10)
                                .background(index % 2 == 0 ? Color.gray : Color.white)
                                .cornerRadius(10)
                                .foregroundColor(index % 2 == 0 ? .white : .black)
                                .frame(maxWidth: 300, alignment: index % 2 == 0 ? .trailing : .leading)
                            if index % 2 != 0 {
                                Spacer() // Pushes message to the left for an 'outgoing' look
                            }
                        }
                    }
                }
            }
            
            MessageInputView()
        }
    }
}

