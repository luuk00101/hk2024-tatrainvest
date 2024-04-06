//
//  ChatWindowView.swift
//  hk2024-tatrainvest
//
//  Created by Lukáš Kollárovič on 06/04/2024.
//

import SwiftUI

struct DiscussView: View {
    @State private var messageText: String = ""
    @State private var messages: [String] = []
    
    var body: some View {
        VStack {
            if messages.isEmpty {
                Text("Discuss")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                ScrollView {
                    ForEach(messages, id: \.self) { message in
                        Text(message)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                    }
                }
            }
            
            Spacer()
            
            // ZStack for placeholder
            ZStack(alignment: .leading) {
                if messageText.isEmpty {
                    Text("Message...")
                        .foregroundColor(.white.opacity(0.7)) // Make the placeholder brighter
                        .padding(.leading, 15)
                }
                TextField("", text: $messageText)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
                    .onSubmit(sendMessage)
            }
        }
        .padding()
        .background(Color("DarkGray"))
        .cornerRadius(10)
        .onAppear { // Add this to ensure the keyboard is dismissed when the view appears
            self.endEditing() // Dismiss the keyboard
        }
    }
    
    private func sendMessage() {
        guard !messageText.isEmpty else { return }
        messages.append(messageText)
        messageText = "" // Update the state directly without animation
        self.endEditing() // Dismiss the keyboard
    }
}

extension View {
    func endEditing() {
        UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
            .first?.windows
            .filter { $0.isKeyWindow }.first?
            .endEditing(true)
    }
}
