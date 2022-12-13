//
//  TopCryptoItemView.swift
//  CryptoCurrency
//
//  Created by Macbook Air M1 on 2022/12/13.
//

import SwiftUI
import Kingfisher

struct TopCryptoItemView: View {
    let topCrypto: Coin
    
    var body: some View {
        VStack {
            // Image
            KFImage(URL(string: topCrypto.image))
                .resizable()
                .frame(width: 45, height: 45)
                .foregroundColor(.orange)
                .padding(.bottom,8)
            // Info
            HStack(spacing: 10) {
                Text(topCrypto.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                Text(topCrypto.currentPrice.toCurrency())
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            // Price Change
            Text(topCrypto.priceChangePercentage24H > 0 ? "+"+topCrypto.priceChangePercentage24H.toPercentage() : topCrypto.priceChangePercentage24H.toPercentage())
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(topCrypto.priceChangePercentage24H > 0 ? .green : .red)
        }
        .frame(width: 140, height: 140)
        .background(Color("ItemBackgroundColor"))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4),lineWidth: 2.5)
        }
    }
}

//struct TopCryptoItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopCryptoItemView()
//    }
//}
