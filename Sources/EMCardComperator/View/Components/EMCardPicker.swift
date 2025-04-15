//
//  SwiftUIView.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 9.04.2025.
//

import SwiftUI

struct EMCardPicker: View {
    
    @Binding var selectedCardId: UUID
    let mockCards = MockData.creditCards
    let backgroundColor: Color
    
    var selectedCard: CreditCard {
        mockCards.first(where: { $0.id == selectedCardId }) ?? mockCards[0]
    }
    
    var body: some View {
        Picker(selection: $selectedCardId) {
            ForEach(mockCards.sorted(by: { $0.bank.name < $1.bank.name }), id: \.id) { card in
                Text(card.bank.name)
                    .font(.title)
                    .bold()
                    .tag(card.id)
            }
        } label: {
            EMPickerLabelView(title: selectedCard.bank.name, backgroundColor: backgroundColor)
        } currentValueLabel: {
            Text(selectedCard.bank.name)
        }
    }
}

#Preview {
    StatefulPreviewWrapper(UUID()) { id in
        EMCardPicker(
            selectedCardId: id,
            backgroundColor: .red
        ).padding()
    }
}
