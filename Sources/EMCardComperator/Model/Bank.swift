//
//  Bank.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 4.04.2025.
//

import SwiftUI

@Observable
class Bank: Codable {
    var name: String
    var size: BankSize
    var website: String
    
    init(name: String, size: BankSize, website: String) {
        self.name = name
        self.size = size
        self.website = website
    }
    
    var logoImageName: String {
        name
            .lowercased()
            .replacingOccurrences(of: " ", with: "") + "_logo"
    }
}

enum BankSize: String, CaseIterable, Codable, Hashable {
    case small
    case medium
    case large
}
