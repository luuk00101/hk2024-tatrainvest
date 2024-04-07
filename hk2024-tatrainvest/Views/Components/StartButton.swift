//
//  StartButton.swift
//  hk2024-tatrainvest
//
//  Created by Samuel Dobrík on 06/04/2024.
//

import SwiftUI

struct StartButton: View {
    let title: String
    let action1: () -> Void
    
    var body: some View {
        Button(action: {
            self.action1()
            self.triggerHapticFeedback(style: .medium)}) {
            Text(title.uppercased())
                .foregroundColor(.black)
                .frame(width: 300, height: 50)
                .background(Color.white)
                .cornerRadius(5)
        }
    }
    
    func triggerHapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
                let generator = UIImpactFeedbackGenerator(style: style)
                generator.impactOccurred()
            }
}

#Preview {
    StartButton(title: "hi") {
        print("a")
    }
}
