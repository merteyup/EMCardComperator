//
//  SwiftUIView.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 9.04.2025.
//

import SwiftUI

struct EMCardPicker: View {
    
    @State var selectedCard: CreditCard
    @Binding var selectedCardId: UUID
    let mockCards = MockData.creditCards
    let backgroundColor: Color
    
    
    var body: some View {
        Picker(selection: $selectedCardId) {
            ForEach(mockCards.sorted(by: { $0.bank.name < $1.bank.name }), id: \.id) { card in
                Text(card.bank.name)
                    .font(.title)
                    .bold()
                    .tag(card.id)
            }
        } label: {
            PickerLabelView(title: selectedCard.bank.name, backgroundColor: backgroundColor)
        } currentValueLabel: {
            Text(selectedCard.bank.name)
        }
    }
}

#Preview {
    @Previewable @State var selectedCardId: UUID = UUID()
    return EMCardPicker(
        selectedCard: CreditCard(
            number: "123456",
            bank: Bank(
                name: "Bank",
                size: .medium,
                website: "www.bank.com"
            ),
            yearlyUsageFee: 125.0,
            isCheapest: false,
            isForStudent: false,
            campaignMessages: ["Campaign"]
        ),
        selectedCardId: $selectedCardId,
        backgroundColor: .blue
    )
}
