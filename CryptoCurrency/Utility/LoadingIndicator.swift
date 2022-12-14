//
//  LoadingIndicator.swift
//  CryptoCurrency
//
//  Created by Macbook Air M1 on 2022/12/14.
//

import SwiftUI

struct LoadingIndicator: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .accentColor(.systemsBackground)
            .scaleEffect(x: 2, y: 2, anchor: .center)
            .background(Color(.systemBackground))
            .cornerRadius(10)
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator()
    }
}
