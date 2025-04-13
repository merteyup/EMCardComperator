//
//  SwiftUIView.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 7.04.2025.
//

import SwiftUI

struct EMCompactLayoutView: View {
    
    var selectedItem: CreditCard
    var viewModel: EMCardComperatorViewModel
    
    var body: some View {
        HStack {
            EMLogoImage(imageName: selectedItem.bank.logoImageName)
            Spacer()
            VStack {
                if selectedItem.isCheapest {
                    EMCheapestBadgeView(isFree: selectedItem.yearlyUsageFee == 0)
                }

                if selectedItem.yearlyUsageFee > 0 {
                    YearlyFeeView(yearlyFeeText: selectedItem.formattedYearlyUsageFee)
                }
            }
            Spacer()
            if let website = URL(string: selectedItem.bank.website) {
                EMLinkButton(to: website, with: "Müşteri Ol") {
                    viewModel.openAccountButtonTapped(with: website)
                }
            }
        }
    }
}

#Preview {
    EMCompactLayoutView(
        selectedItem: MockData.creditCards.first!,
        viewModel: EMCardComperatorViewModel(delegate: PreviewDelegate())
    )
}

