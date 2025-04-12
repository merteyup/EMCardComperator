//
//  SwiftUIView.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 7.04.2025.
//

import SwiftUI

struct EMExpandedLayoutView: View {
    var selectedItem: CreditCard
    var viewModel: EMCardComperatorViewModel
    var isAnimationActivated: Bool
    
    var body: some View {
        VStack {
            EMBankHeaderView(imageName: selectedItem.bank.logoImageName)
            
            EMCampaignListView(
                messages: selectedItem.campaignMessages,
                isAnimated: isAnimationActivated
            )
            .frame(minHeight: 100)
            .padding()

            EMPreApprovedLimitView(
                limitText: "60.000TL",
                websiteURL: selectedItem.bank.website,
                viewModel: viewModel
            )
        }
    }
}

struct EMBankHeaderView: View {
    var imageName: String

    var body: some View {
        HStack {
            EMLogoImage(imageName: imageName)
                .overlay(
                    RoundedRectangle(cornerRadius: 8, style: .circular)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                )

            Image(systemName: "wave.3.right")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 25)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

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
    EMExpandedLayoutView(selectedItem: MockData.creditCards.first!,
                         viewModel: EMCardComperatorViewModel(delegate: PreviewDelegate()),
                         isAnimationActivated: true)
}
