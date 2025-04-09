//
//  SwiftUIView.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 9.04.2025.
//

import SwiftUI

struct EMPickerLabelView: View {
    let title: String
    let backgroundColor: Color
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "creditcard")
                .foregroundColor(.white)
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}


#Preview {
    EMPickerLabelView(title: "Picker Label", backgroundColor: .cyan)
}
