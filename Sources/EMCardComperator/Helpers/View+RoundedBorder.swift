//
//  View+RoundedBorder.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 15.04.2025.
//

import SwiftUI

extension View {
    func roundedBorder(cornerRadius: CGFloat = 8,
                       fillColor: Color = .white,
                       borderColor: Color = .black,
                       lineWidth: CGFloat = 1) -> some View {
        self.modifier(EMRoundedBorderModifier(
            cornerRadius: cornerRadius,
            fillColor: fillColor,
            borderColor: borderColor,
            lineWidth: lineWidth
        ))
    }
}
