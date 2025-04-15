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
            .padding(.vertical, 8)

            EMPreApprovedLimitView(
                limitText: "60.000TL",
                websiteURL: selectedItem.bank.website,
                viewModel: viewModel
            )
        }
    }
}

#Preview {
    EMExpandedLayoutView(selectedItem: MockData.creditCards.first!,
                         viewModel: EMCardComperatorViewModel(delegate: PreviewDelegate(), selectedCardID: UUID()),
                         isAnimationActivated: true)
}
