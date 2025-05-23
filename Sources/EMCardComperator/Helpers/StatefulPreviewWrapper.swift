//
//  StatefulPreviewWrapper.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 15.04.2025.
//

import SwiftUI

struct StatefulPreviewWrapper<Value: Equatable, Content: View>: View {
    @State private var value: Value
    var content: (Binding<Value>) -> Content

    init(_ initialValue: Value, @ViewBuilder content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: initialValue)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}
