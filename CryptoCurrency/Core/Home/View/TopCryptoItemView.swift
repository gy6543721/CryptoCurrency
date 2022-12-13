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
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom,8)
            // Info
            HStack(spacing: 2) {
                Text(topCrypto.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                Text("$\(topCrypto.currentPrice)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            // Price Change
            Text("\(topCrypto.priceChangePercentage24H.formatted(.percent))")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.green)
        }
        .frame(width: 140, height: 140)
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
