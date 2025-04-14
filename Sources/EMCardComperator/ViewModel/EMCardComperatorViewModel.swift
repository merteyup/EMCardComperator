//
//  EMCardComperatorViewModel.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 7.04.2025.
//

import Foundation

@MainActor
public final class EMCardComperatorViewModel: ObservableObject {
    public weak var delegate: EMCardComperatorDelegate?
    
    public var isCompactLayoutEnabled: Bool = true
    public var isDominantColorActive: Bool = true
    @Published public var selectedCardID: UUID


    public init(delegate: EMCardComperatorDelegate? = nil,
                selectedCardID: UUID,
                isCompactLayoutEnabled: Bool = true,
                isDominantColorActive: Bool = true) {
        self.delegate = delegate
        self.selectedCardID = selectedCardID
        self.isCompactLayoutEnabled = isCompactLayoutEnabled
        self.isDominantColorActive = isDominantColorActive
    }

    public func openAccountButtonTapped(with url: URL) {
        delegate?.userDidTapOpenAccount(url: url)
    }
}
