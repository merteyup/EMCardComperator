//
//  CreditCard.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 4.04.2025.
//
import SwiftUI

@Observable
class CreditCard: Codable, Identifiable, Equatable {
    public var id: UUID = UUID()
    var number: String
    var bank: Bank
    var yearlyUsageFee: Decimal
    var isCheapest: Bool = false
    var isForStudent: Bool
    let campaignMessages: [String]

    init(
        id: UUID = UUID(),
        number: String,
        bank: Bank,
        yearlyUsageFee: Decimal,
        isCheapest: Bool,
        isForStudent: Bool,
        campaignMessages: [String]
    ) {
        self.id = id
        self.number = number
        self.bank = bank
        self.yearlyUsageFee = yearlyUsageFee
        self.isCheapest = isCheapest
        self.isForStudent = isForStudent
        self.campaignMessages = campaignMessages
    }
    
    static func == (lhs: CreditCard, rhs: CreditCard) -> Bool {
        return lhs.id == rhs.id
    }
}

extension CreditCard {
    var formattedYearlyUsageFee: String {
        NumberFormatter.currencyTRY.string(from: yearlyUsageFee as NSNumber) ?? "-"
    }
}
