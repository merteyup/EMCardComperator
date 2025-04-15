//
//  EMCampaignListView.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 12.04.2025.
//

import SwiftUI

enum IconAlignment {
    case left
    case right
}

struct EMCampaignListView: View {
    let messages: [String]
    let isAnimated: Bool
    var iconAlignment: IconAlignment = .left
    var iconImage: String = "checkmark.circle.fill"

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if messages.isEmpty {
                Text("Kampanyasız görünüm için iyileştirmeye açıktır.")
                    .foregroundColor(.secondary)
                    .italic()
            } else {
                ForEach(messages, id: \.self) { message in
                    HStack(alignment: .center, spacing: 8) {
                        if iconAlignment == .left {
                            iconView
                        }
                        
                        Text(message)
                            .font(.callout)
                            .lineLimit(1)
                            .minimumScaleFactor(0.7)
                            .foregroundStyle(.primary)
                        
                        if iconAlignment == .right {
                            Spacer()
                            iconView
                        }
                    }
                }
            }
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 6)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var iconView: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 24, height: 24)
            
            Image(systemName: iconImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(isAnimated ? .green : .gray)
                .font(.system(size: 16, weight: .bold))
                .frame(width: 16, height: 16)
        }
        .animation(.easeInOut(duration: isAnimated ? 0.5 : 0), value: isAnimated)
    }
}


#Preview {
    EMCampaignListView(messages: [
        "Yurt dışı harcamalarda %10 indirim fırsatı!",
        "Axess’e özel tatil kampanyaları seni bekliyor.",
        "Her 3 alışverişe 1 hediye kahve!"
    ],isAnimated: true).padding()
}
