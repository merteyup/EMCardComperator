//
//  EMCardComperatorViewModel.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 7.04.2025.
//

import Foundation

public final class EMCardComperatorViewModel: ObservableObject {
    public weak var delegate: EMCardComperatorDelegate?
    
    public var isCompactLayoutEnabled: Bool = true
    public var isDominantColorActive: Bool = true

    public init(delegate: EMCardComperatorDelegate? = nil,
                isCompactLayoutEnabled: Bool = true,
                isDominantColorActive: Bool = true) {
        self.delegate = delegate
        self.isCompactLayoutEnabled = isCompactLayoutEnabled
        self.isDominantColorActive = isDominantColorActive
    }

    public func openAccountButtonTapped(with url: URL) {
        delegate?.userDidTapOpenAccount(url: url)
    }
}
