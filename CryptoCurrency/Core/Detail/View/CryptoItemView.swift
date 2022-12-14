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
                    if percentageChange > 0 {
                        Image(systemName: "triangle.righthalf.filled")
                            .font(.caption)
                            .foregroundColor(.green)
                        Text("+"+percentageChange.toPercentage())
                            .font(.caption)
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "triangle.lefthalf.filled")
                            .font(.caption)
                            .foregroundColor(.red)
                        Text(percentageChange.toPercentage())
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}

struct OverviewItemView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoItemView(model: dev.status1)
    }
}
