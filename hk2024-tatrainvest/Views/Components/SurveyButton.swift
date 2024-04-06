//
//  SurveyButton.swift
//  hk2024-tatrainvest
//
//  Created by Samuel Dobrík on 06/04/2024.
//

import SwiftUI

struct SurveyButton: View {
    let title: String
    let action1: () -> Void
    let bgColor: Color = Color(red: 1/255, green: 142/255, blue: 237/255, opacity: 1.0)
    
    var body: some View {
        Button(action: action1) {
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
}

#Preview {
    SurveyButton(title: "hi") {
        print("asdf")
    }
}
