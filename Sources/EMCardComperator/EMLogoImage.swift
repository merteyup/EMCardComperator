//
//  SwiftUIView.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 7.04.2025.
//

import SwiftUI

struct EMLogoImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName, bundle: .module)
            .resizable()
            .scaledToFit()
            .frame(width: 75, height: 42)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    EMLogoImage(imageName: "akbank_logo")
}
