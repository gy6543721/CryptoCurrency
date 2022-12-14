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
            Text("All")
                .font(.title2)
                .fontWeight(.bold)
            // ItemInfo
            HStack (spacing: 2) {
                Text("Coin")
                Spacer()
                Text("Price")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.top, 0.5)
            
            // ItemView
            VStack {
                ForEach(viewModel.coins) { coin in
                    NavigationLink {
                        CryptoDetailView(coinDetail: coin)
                    } label: {
                        AllCryptoItemView(coin: coin)
                    }
                    .buttonStyle(PlainButtonStyle())
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
