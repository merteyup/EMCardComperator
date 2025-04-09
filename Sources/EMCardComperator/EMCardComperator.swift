//
//  SelectItemView.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 4.04.2025.
//


import SwiftUI

public struct SelectItemView: View {
    
    @ObservedObject private var viewModel: EMCardComperatorViewModel
    
    private let mockCards = MockData.creditCards
    var isDominantColorActive: Bool
    var isCompactLayoutEnabled: Bool

    @State private var backgroundColor: Color = .red.opacity(0.6)
    @State private var selectedCardID: UUID
    @State private var isAnimationActivated = false
    

    public init(viewModel: EMCardComperatorViewModel,
                isDominantColorActive: Bool,
                isCompactLayoutEnabled: Bool = false) {
        self._viewModel = ObservedObject(initialValue: viewModel)
        self.isDominantColorActive = isDominantColorActive
        self.isCompactLayoutEnabled = isCompactLayoutEnabled
        let firstCardID = MockData.creditCards.first?.id ?? UUID()
        _selectedCardID = State(initialValue: firstCardID)
        _backgroundColor = State(initialValue: isDominantColorActive ? .red.opacity(0.6) : .clear)
    }

    
    var selectedItem: CreditCard {
        mockCards.first { $0.id == selectedCardID } ?? MockData.defaultCard
    }
    
    private var selectedCardName: String {
        selectedItem.bank.name
    }

    public var body: some View {
        
        EMCardPicker(selectedCard: selectedItem,
                     selectedCardId: $selectedCardID,
                     backgroundColor: backgroundColor)
        .onChange(of: selectedCardID) { _, newCardID in
            guard mockCards.first(where: { $0.id == newCardID }) != nil else { return }
            isAnimationActivated = false
            
            if isDominantColorActive {
                if let uiImage = ImageUtils.loadImage(named: selectedItem.bank.logoImageName) {
                    backgroundColor = ImageUtils.extractDominantColor(from: uiImage)
                }
            } else {
                backgroundColor = .clear
            }
            
            withAnimation(.easeInOut(duration: 0.5)) {
                isAnimationActivated = true
            }
        }
        VStack {
            if isCompactLayoutEnabled {
                EMCompactLayoutView(selectedItem: selectedItem,
                                    viewModel: viewModel)
                .padding()
            } else {
                EMExpandedLayoutView(selectedItem: selectedItem,
                                     viewModel: viewModel,
                                     isAnimationActivated: isAnimationActivated)
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
            }
        }
        .background(LinearGradient(colors: [(Color.init(backgroundColor)), .white],
                                   startPoint: .bottom,
                                   endPoint: .top))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
        .overlay(
            RoundedRectangle(cornerRadius: 8, style: .circular)
                .stroke(Color.gray.opacity(0.2), lineWidth: 2)
        )
        .padding()
    }
}


final class PreviewDelegate: EMCardComperatorDelegate {
    func userDidTapOpenAccount(url: URL) {
        print("Preview - tapped link: \(url)")
    }
}

#Preview {
    let previewViewModel = EMCardComperatorViewModel(delegate: PreviewDelegate())
    SelectItemView(viewModel: previewViewModel, isDominantColorActive: false)
}



