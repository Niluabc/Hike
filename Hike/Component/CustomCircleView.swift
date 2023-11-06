//
//  CustomCircleView.swift
//  Hike
//
//  Created by Nilam Shah on 06/11/23.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [.customIndigoMedium, .customSalmonLight], startPoint: isAnimateGradient ? .topLeading : .bottomLeading, endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing)
                )
                .frame(width: 256, height: 256)
                .onAppear {
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimateGradient.toggle()
                    }
            }
            
            MotionAnimationView()
        }
    }
}

#Preview {
    CustomCircleView()
}
