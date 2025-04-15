//
//  EMBankHeaderView.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 12.04.2025.
//

import SwiftUI

struct EMBankHeaderView: View {
    var imageName: String

    var body: some View {
        HStack {
            EMLogoImage(imageName: imageName)
                .overlay(
                    RoundedRectangle(cornerRadius: 8, style: .circular)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                )

            Image(systemName: "wave.3.right")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 25)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    EMBankHeaderView(imageName: "wave.3.right").padding()
}
