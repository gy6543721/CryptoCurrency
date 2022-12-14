//
//  OverviewViewModel.swift
//  CryptoCurrency
//
//  Created by Macbook Air M1 on 2022/12/14.
//

import Foundation

class CryptoViewModel: ObservableObject {
    private let coin: Coin
    
    var overviewInfoModel: CryptoSectionModel {
        // Price status
        let price = coin.currentPrice.toCurrency()
        let pricePercentChange = coin.priceChangePercentage24H
        let priceStatus = CryptoDetailModel(title: "Current Price", value: price, percentageChange: pricePercentChange)
        
        // Market cap status
        let marketCap = coin.marketCap.formatted(.number).description
        let marketCapPercentage = coin.priceChangePercentage24H
        let marketCapStatus = CryptoDetailModel(title: "Market Capitalization", value: marketCap, percentageChange: marketCapPercentage)
        
        // Rank status
        let rank = coin.marketCapRank.formatted(.number).description
        let rankStatus = CryptoDetailModel(title: "Rank", value: rank, percentageChange: nil)
        
        // Volumn status
        let volumn = coin.totalVolume?.formatted(.number).description
        let volumnStatus = CryptoDetailModel(title: "Volume", value: volumn ?? "n/a", percentageChange: nil)
        
        return CryptoSectionModel(title: "Overview", status: [priceStatus, marketCapStatus, rankStatus, volumnStatus])
    }
    
    var additionalInfoModel: CryptoSectionModel {
        // 24H high status
        let high = coin.high24H?.toCurrency() ?? "n/a"
        let highStatus = CryptoDetailModel(title: "24H High", value: high, percentageChange: nil)
        
        // 24H low status
        let low = coin.low24H?.toCurrency() ?? "n/a"
        let lowStatus = CryptoDetailModel(title: "24H Low", value: low, percentageChange: nil)
        
        // 24H price change status
        let priceChange = coin.priceChange24H.toCurrency()
        let pricePercentageChange = coin.priceChangePercentage24H
        let priceChangeStatus = CryptoDetailModel(title: "24H Price Change", value: priceChange, percentageChange: pricePercentageChange)
        
        // 24H marketcap change status
        let marketCapChange = coin.marketCapChange24H?.formatted(.number).description
        let marketCapPercentageChange = coin.marketCapChangePercentage24H
        let marketCapChangeStatus = CryptoDetailModel(title: "24H Market Capitalization", value: marketCapChange ?? "n/a", percentageChange: marketCapPercentageChange)
        
        return CryptoSectionModel(title: "Additional", status: [highStatus, lowStatus, priceChangeStatus, marketCapChangeStatus])
    }
    
    init(coin: Coin) {
        self.coin = coin
    }
    
    func getCoinName()-> String {
        return self.coin.name
    }
}
