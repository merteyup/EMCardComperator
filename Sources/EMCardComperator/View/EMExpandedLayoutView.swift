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
            HStack {
                EMLogoImage(imageName: selectedItem.bank.logoImageName)
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
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(selectedItem.campaignMessages, id: \.self) { message in
                    HStack(alignment: .top) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(isAnimationActivated ? .green : .gray)
                            .animation(.easeInOut(duration: isAnimationActivated ? 0.5 : 0), value: isAnimationActivated)
                        Text(message)
                            .font(.callout)
                            .lineLimit(1)
                            .minimumScaleFactor(0.7)
                    }
                }
                
                if selectedItem.campaignMessages.count == 0 {
                    Text("Kampanyasız görünüm için iyileştirmeye açıktır.")
                        .foregroundColor(.gray)
                }
            }
            .frame(minHeight: 100)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            HStack {
                Text("Ön Onaylı Limit:")
                    .font(.caption)
                Text("60.000TL")
                    .font(.caption)
                    .bold()
                
                if let website = URL(string: selectedItem.bank.website) {
                    EMLinkButton(to: website, with: "Müşteri Ol") {
                        viewModel.openAccountButtonTapped(with: website)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }    }
}

#Preview {
    EMExpandedLayoutView(selectedItem: MockData.creditCards.first!,
                         viewModel: EMCardComperatorViewModel(delegate: PreviewDelegate()),
                         isAnimationActivated: true)
}
