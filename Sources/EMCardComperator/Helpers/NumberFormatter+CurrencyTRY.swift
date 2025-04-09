//
//  NumberFormatter+CurrencyTRY.swift
//  PackageContainerApp
//
//  Created by Eyüp MERT on 4.04.2025.
//

import Foundation

extension NumberFormatter {
    static let currencyTRY: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "TRY"
        return formatter
    }()
}
