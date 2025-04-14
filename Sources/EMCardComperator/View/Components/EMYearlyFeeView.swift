//
//  EMYearlyFeeView.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 12.04.2025.
//

import SwiftUI

struct YearlyFeeView: View {
    let yearlyFeeText: String

    var body: some View {
        HStack(spacing: 4) {
            Text("Yıllık")
            Text(yearlyFeeText)
                .foregroundStyle(.primary)
                .shadow(color: .white.opacity(0.2), radius: 1, x: 0, y: 1)
        }.padding(.vertical, 4)
            .padding(.horizontal, 6)
            .background(.white)
            .foregroundStyle(.primary)
            .clipShape(.capsule)
    }
}
