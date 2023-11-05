//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Nilam Shah on 05/11/23.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // Mark: 3. Depth
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            // MARK: 2. Light
            Color.customGrayLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            // MARK: 1. Surface
            LinearGradient(colors: [.customGreenLight, .customGreenMedium],
                           startPoint: .top,
                           endPoint: .bottom)
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
