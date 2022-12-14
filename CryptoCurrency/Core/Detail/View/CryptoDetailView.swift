//
//  CryptoDetailView.swift
//  CryptoCurrency
//
//  Created by Macbook Air M1 on 2022/12/14.
//

import SwiftUI

struct CryptoDetailView: View {
    let viewModel: CryptoViewModel
    
    init(coinDetail: Coin) {
        self.viewModel = CryptoViewModel(coin: coinDetail)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                // Chart
                
                // Overview
                CryptoSessionView(model: viewModel.overviewSessionModel)
                    .padding(.vertical)
                
                // Additional Details
                CryptoSessionView(model: viewModel.additionalDetailModel)
                    .padding(.vertical)
            }
            .navigationTitle(viewModel.getCoinName())
        }
    }
}

struct CryptoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoDetailView(coinDetail: dev.coin)
    }
}
