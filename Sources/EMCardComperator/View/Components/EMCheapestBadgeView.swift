//
//  EMCheapestBadgeView.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 12.04.2025.
//

import SwiftUI

struct EMCheapestBadgeView: View {
    let isFree: Bool
    @State private var animateGradient = false

    var body: some View {
        let lines = isFree ? ["Kart Aidatı", "Yok"] : ["En", "Uygunu"]

        VStack(spacing: 2) {
            ForEach(lines, id: \.self) { line in
                Text(line)
                    .badgeStyle()
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.cyan, Color.mint]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .hueRotation(.degrees(animateGradient ? 90 : 0))
            .animation(.linear(duration: 10).repeatForever(autoreverses: true), value: animateGradient)
        )
        .cornerRadius(8)
        .scaleEffect(animateGradient ? 1.02 : 1)
        .onAppear {
            animateGradient = true
        }
    }
}

private struct BadgeTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
    }
}

private extension View {
    func badgeStyle() -> some View {
        self.modifier(BadgeTextStyle())
    }
}
