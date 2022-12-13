//
//  AllCryptoView.swift
//  CryptoCurrency
//
//  Created by Macbook Air M1 on 2022/12/13.
//

import SwiftUI

struct AllCryptoView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text("All Cryptos")
                .font(.title2)
                .fontWeight(.bold)
            // ItemInfo
            HStack (spacing: 2) {
                Text("Cryptos")
                Spacer()
                Text("Prices")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.top, 0.5)
            
            // ItemView
            VStack {
                ForEach(viewModel.coins) { coin in
                    AllCryptoItemView(coin: coin)
                }
            }
        }.padding()
        
    }
}

struct AllCryptoView_Previews: PreviewProvider {
    static var previews: some View {
        AllCryptoView(viewModel: HomeViewModel())
    }
}
