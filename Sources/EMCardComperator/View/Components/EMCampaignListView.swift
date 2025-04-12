//
//  EMCampaignListView.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 12.04.2025.
//

import SwiftUI

struct EMCampaignListView: View {
    let messages: [String]
    let isAnimated: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if messages.isEmpty {
                Text("Kampanyasız görünüm için iyileştirmeye açıktır.")
                    .foregroundColor(.gray)
            } else {
                ForEach(messages, id: \.self) { message in
                    HStack(alignment: .top) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(isAnimated ? .green : .gray)
                            .animation(.easeInOut(duration: isAnimated ? 0.5 : 0), value: isAnimated)
                        Text(message)
                            .font(.callout)
                            .lineLimit(1)
                            .minimumScaleFactor(0.7)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
