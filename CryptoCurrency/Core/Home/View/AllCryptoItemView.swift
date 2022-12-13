//
//  AllCryptoItemView.swift
//  CryptoCurrency
//
//  Created by Macbook Air M1 on 2022/12/13.
//

import SwiftUI
import Kingfisher

struct AllCryptoItemView: View {
    let coin: Coin
    
    var body: some View {
        HStack {
            // Market Rank
            Text("\(coin.marketCapRank.formatted(.number))")
                .foregroundColor(.gray)
                .font(.caption)
            
            // Icon
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12)
                .foregroundColor(.orange)
            
            // Info
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.leading, 5)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            // Price
            VStack(alignment: .trailing, spacing: 4) {
                Text("$\(coin.currentPrice)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text("\(coin.priceChangePercentage24H.formatted(.percent))")
                    .font(.caption)
                    .foregroundColor(.green)
                    .padding(.leading, 5)
            }
            .padding(.leading, 2)
        }
        .padding(.horizontal, 4)
        .padding(.vertical, 4)
    }
}

//struct AllCryptoItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCryptoItemView()
//    }
//}
