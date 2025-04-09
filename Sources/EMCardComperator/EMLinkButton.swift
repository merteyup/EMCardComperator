//
//  SwiftUIView.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 7.04.2025.
//

import SwiftUI

public struct EMLinkButton: View {
    private let url: URL
    private let title: String
    private let onTap: (() -> Void)?

    public init(to url: URL, with title: String, onTap: (() -> Void)? = nil) {
        self.url = url
        self.title = title
        self.onTap = onTap
    }

    public var body: some View {
        Button {
            onTap?()
            UIApplication.shared.open(url)
        } label: {
            Text(title)
                .padding(10)
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.buttonBorder)
        }
    }
}


#Preview {
    EMLinkButton(to: URL(string: "https://www.akbank.com.tr")!,
                 with: "Müşteri Ol")
}
