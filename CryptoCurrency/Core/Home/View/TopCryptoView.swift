//
//  TopCryptoView.swift
//  CryptoCurrency
//
//  Created by Macbook Air M1 on 2022/12/13.
//

import SwiftUI

struct TopCryptoView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text("Top Cryptos")
                .font(.title2)
                .fontWeight(.bold)
            // ItemView
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    ForEach(viewModel.topCrypto) { crypto in
                        TopCryptoItemView(topCrypto: crypto)
                    }
                }
            }
        }.padding()
    }
}

struct TopCryptoView_Previews: PreviewProvider {
    static var previews: some View {
        TopCryptoView(viewModel: HomeViewModel())
    }
}
