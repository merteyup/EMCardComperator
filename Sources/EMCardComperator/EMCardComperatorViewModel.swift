//
//  EMCardComperatorViewModel.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 7.04.2025.
//

import Foundation

public final class EMCardComperatorViewModel: ObservableObject {
    public weak var delegate: EMCardComperatorDelegate?

    public init(delegate: EMCardComperatorDelegate? = nil) {
        self.delegate = delegate
    }

    public func openAccountButtonTapped(with url: URL) {
        delegate?.userDidTapOpenAccount(url: url)
    }
}
