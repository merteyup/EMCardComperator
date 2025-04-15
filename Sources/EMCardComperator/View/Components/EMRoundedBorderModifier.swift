//
//  EMRoundedBorderModifier.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 15.04.2025.
//

import SwiftUI

struct EMRoundedBorderModifier: ViewModifier {
    var cornerRadius: CGFloat = 8
    var fillColor: Color = .white
    var borderColor: Color = .black
    var lineWidth: CGFloat = 1

    func body(content: Content) -> some View {
        content
            .padding(.vertical, 4)
            .padding(.horizontal, 6)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(fillColor)
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: lineWidth)
            )
    }
}
