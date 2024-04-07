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

    var body: some View {
        VStack {
            Slider(
                value: $speed,
                in: 0...100,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            )
            Text("\(speed)")
                .foregroundColor(isEditing ? .red : .blue)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}


struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
