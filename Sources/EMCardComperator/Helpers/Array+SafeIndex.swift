//
//  Array+SafeIndex.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 7.04.2025.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
