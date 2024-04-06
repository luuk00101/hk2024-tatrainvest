//
//  DashboardView.swift
//  hk2024-tatrainvest
//
//  Created by Lukáš Kollárovič on 06/04/2024.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack {
            TopBarView()
            Button(action: {
                            // Action for tapping on the portfolio balance
                        }) {
                            Image("main-report")
                        }
            DiscussView()
            BottomNavBarView()
        }
        .background(Color.black)
    }
}

#Preview {
    DashboardView()
}
