//
//  EMPreapprovedLimitView.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 12.04.2025.
//

import SwiftUI

struct EMPreApprovedLimitView: View {
    let limitText: String
    let websiteURL: String
    let viewModel: EMCardComperatorViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Ön Onaylı Limit")
                    .font(.caption)
                    .foregroundColor(.secondary)

                Text(limitText)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.green)
            }

            Spacer()

            if let url = URL(string: websiteURL) {
                EMLinkButton(to: url, with: "Müşteri Ol") {
                    viewModel.openAccountButtonTapped(with: url)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.green)
                .foregroundColor(.white)
                .font(.caption)
                .cornerRadius(8)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemGray6))
        )
    }
}


#Preview {
    EMPreApprovedLimitView(limitText: "60.000",
                           websiteURL: "www.apple.com.tr",
                           viewModel: EMCardComperatorViewModel()).padding()
}
