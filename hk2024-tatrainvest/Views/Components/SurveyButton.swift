//
//  SurveyButton.swift
//  hk2024-tatrainvest
//
//  Created by Samuel Dobrík on 06/04/2024.
//

import SwiftUI

struct SurveyButton: View {
    let title: String
    let action: () -> Void // Renamed for clarity
    let bgColor: Color = Color.blue // Placeholder for your Color("MainBlue")
    
    var body: some View {
        Button(action: {
            self.action() // This calls the action passed to the button
            self.triggerHapticFeedback(style: .medium) // This triggers the haptic feedback immediately after
        }) {
            Text(title.uppercased())
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(bgColor)
                .cornerRadius(5)
                .font(.system(size: 14))
                .bold()
                .padding(5)
        }
    }
    
    func triggerHapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct SurveyButton_Previews: PreviewProvider {
    static var previews: some View {
        SurveyButton(title: "hi") {
            print("Button tapped")
        }
    }
}

