//
//  Color+UIColorInit.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 7.04.2025.
//

import SwiftUI

extension Color {
    init(uiColor: UIColor) {
        self = Color(UIColor(red: uiColor.cgColor.components?[0] ?? 0,
                             green: uiColor.cgColor.components?[1] ?? 0,
                             blue: uiColor.cgColor.components?[2] ?? 0,
                             alpha: uiColor.cgColor.components?[3] ?? 1))
    }
}
