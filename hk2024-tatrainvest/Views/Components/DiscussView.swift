//
//  DiscussView.swift
//  hk2024-tatrainvest
//
//  Created by Lukáš Kollárovič on 06/04/2024.
//

import SwiftUI
import Combine

struct DiscussView: View {
    @State private var messageText: String = ""
    @State private var chatMessages: [ChatMessage] = ChatMessage.sampleMessgaes
    let openAIService = OpenAIService()
    @State private var cancellables = Set<AnyCancellable>()
    
    var body: some View {
        VStack {
            if chatMessages.isEmpty {
                Text("Discuss with TIM")
                    .font(Font.title.weight(.light))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                ScrollView {
                    ForEach(chatMessages, id:\.id) { message in
                        messageView(message: message)
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
                    //.onSubmit(sendMessage)
            }
        }
        .padding()
        .background(Color("DarkGray"))
        .cornerRadius(10)
        .onAppear {
            //openAIService.sendMessage(message: "You're a helpful financial assistant. Today's biggest financial event was the Bitcoin (BTC) coin hitting an all time high of 60 000$ and the fall of 20% of the Tesla stock. Help the user and keep this in mind. Greet him with the next question. STICK TO YOUR ROLE!")
            self.endEditing() // Dismiss the keyboard
        }
    }
    
    func messageView(message: ChatMessage) -> some View {
        HStack {
            if (message.isUser) {
                Spacer()
            }
            
            Text(message.content)
                .foregroundColor(message.isUser ? .white : .white)
                .padding()
                .background(message.isUser ? .blue : .gray.opacity(0.1))
                .cornerRadius(16)
            
            if (!message.isUser) {
                Spacer()
            }
        }
        
    }
    
    func sendMessage() {
        guard !messageText.isEmpty else { return }
        let myMessage = ChatMessage(id: UUID().uuidString, content: messageText, isUser: true)
        chatMessages.append(myMessage)
        print("sending message")
        openAIService.sendMessage(message: messageText).sink { completion in }
        receiveValue: { response in
            DispatchQueue.main.async {
                guard let textResponse = response.choices.first?.text else { return }
                let gptMessage = ChatMessage(id: response.id, content: textResponse, isUser: false)
                self.chatMessages.append(gptMessage)
            }
        }.store(in: &cancellables)

        
        messageText = "" // Update the state directly without animation
        self.endEditing() // Dismiss the keyboard
        //}
    }
}

struct ChatMessage {
    let id: String
        let content: String
        let isUser: Bool
    }

extension ChatMessage {
    static let sampleMessgaes = [
        ChatMessage(id: UUID().uuidString, content: "Hello, how can I help you?", isUser: false),
        
        ChatMessage(id: UUID().uuidString, content: "What's the biggest financial event that happened in the last 24 hours?", isUser: true),
        
        ChatMessage(id: UUID().uuidString, content: "Among the biggest news of the last 24 hours is the decline of of market, resulting in massive layoffs of chinese stockbrokers.", isUser: false)
    ]
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
