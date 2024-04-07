//
//  Slider.swift
//  hk2024-tatrainvest
//
//  Created by Samuel Dobrík on 07/04/2024.
//

import SwiftUI

struct SliderView: View {
    @State private var speed = 50.0
    @State private var isEditing = false
    @State private var leftText: String = ""
    @State private var rightText: String = ""
    
    let bgColor: Color = Color("MainBlue")
    
    init(leftText: String, rightText: String) {
        self._leftText = State(initialValue: leftText)
        self._rightText = State(initialValue: rightText)
    }

    var body: some View {
        VStack {
            Text(leftText)
                .foregroundColor(bgColor)
                .padding(50)
                .font(.system(size: 25))
                .bold()
            
            Slider(
                value: $speed,
                in: 0...100,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            )
            .rotationEffect(.degrees(-90))
            .padding(70)
            .accentColor(bgColor)
            
            Text(rightText)
                .foregroundColor(bgColor)
                .padding(50)
                .font(.system(size: 25))
                .bold()
        }
    }
}



struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(leftText: "Custom Left Text", rightText: "Custom Right Text")






    }
}


struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(leftText: "Custom Left Text", rightText: "Custom Right Text")






    }
}
