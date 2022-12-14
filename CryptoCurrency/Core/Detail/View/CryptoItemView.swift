//
//  OverviewItemView.swift
//  CryptoCurrency
//
//  Created by Macbook Air M1 on 2022/12/14.
//

import SwiftUI

struct CryptoItemView: View {
    let model: CryptoDetailModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(model.title)
                .font(.caption)
            Text(model.value)
                .font(.headline)
            
            if let percentageChange = model.percentageChange {
                HStack(spacing: 4) {
                    Image(systemName: "triangle.fill")
                        .font(.caption)
                    Text(percentageChange.toPercentage())
                        .font(.caption)
                }
                .foregroundColor(.green)
            }
        }
    }
}

struct OverviewItemView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoItemView(model: dev.status1)
    }
}
