//
//  File.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 9.04.2025.
//

import Foundation

public protocol EMCardComperatorDelegate: AnyObject {
    func userDidTapOpenAccount(url: URL)
}
