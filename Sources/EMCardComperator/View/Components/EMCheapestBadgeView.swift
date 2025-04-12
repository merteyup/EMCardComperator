//
//  EMCheapestBadgeView.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 12.04.2025.
//

import SwiftUI

struct CheapestBadgeView: View {
    let isFree: Bool

    var body: some View {
        let lines = isFree ? ["Kart Aidatı", "Yok"] : ["En", "Uygunu"]

        VStack {
            ForEach(lines, id: \.self) { line in
                Text(line)
                    .badgeStyle()
            }
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 2)
        .background(.green)
        .cornerRadius(6)
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
