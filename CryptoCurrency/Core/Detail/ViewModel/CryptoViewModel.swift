//
//  OverviewViewModel.swift
//  CryptoCurrency
//
//  Created by Macbook Air M1 on 2022/12/14.
//

import Foundation

class CryptoViewModel: ObservableObject {
    private let coinData: Coin
    
    // Chart Config
    var chartData = [ChartData]()
    var startDate = Date()
    var endDate = Date()
    var minPrice = 0.0
    var maxPrice = 0.0
    var xAxisValue = [Date]()
    var yAxisValue = [Double]()
    var colorLndicator = Bool(true)
    
    var overviewInfoModel: CryptoSectionModel {
        // Price status
        let price = coinData.currentPrice.toCurrency()
        let pricePercentChange = coinData.priceChangePercentage24H
        let priceStatus = CryptoDetailModel(title: "Current Price", value: price, percentageChange: pricePercentChange)
        
        // Market cap status
        let marketCap = coinData.marketCap.toLargeNumber()
        let marketCapPercentage = coinData.priceChangePercentage24H
        let marketCapStatus = CryptoDetailModel(title: "Market Capitalization", value: marketCap, percentageChange: marketCapPercentage)
        
        // Rank status
        let rank = coinData.marketCapRank.formatted(.number).description
        let rankStatus = CryptoDetailModel(title: "Rank", value: rank, percentageChange: nil)
        
        // Volumn status
        let volumn = coinData.totalVolume?.toLargeNumber()
        let volumnStatus = CryptoDetailModel(title: "Volume", value: volumn ?? "n/a", percentageChange: nil)
        
        return CryptoSectionModel(title: "Overview", status: [priceStatus, marketCapStatus, rankStatus, volumnStatus])
    }
    
    var additionalInfoModel: CryptoSectionModel {
        // 24H high status
        let high = coinData.high24H?.toCurrency() ?? "n/a"
        let highStatus = CryptoDetailModel(title: "24H High", value: high, percentageChange: nil)
        
        // 24H low status
        let low = coinData.low24H?.toCurrency() ?? "n/a"
        let lowStatus = CryptoDetailModel(title: "24H Low", value: low, percentageChange: nil)
        
        // 24H price change status
        let priceChange = coinData.priceChange24H.toCurrency()
        let pricePercentageChange = coinData.priceChangePercentage24H
        let priceChangeStatus = CryptoDetailModel(title: "24H Price Change", value: priceChange, percentageChange: pricePercentageChange)
        
        // 24H marketcap change status
        let marketCapChange = coinData.marketCapChange24H?.toLargeNumber()
        let marketCapPercentageChange = coinData.marketCapChangePercentage24H
        let marketCapChangeStatus = CryptoDetailModel(title: "24H Market Capitalization", value: marketCapChange ?? "n/a", percentageChange: marketCapPercentageChange)
        
        return CryptoSectionModel(title: "Additional", status: [highStatus, lowStatus, priceChangeStatus, marketCapChangeStatus])
    }
    
    init(coin: Coin) {
        self.coinData = coin
        configureChartData()
        
        print("DEBUG: Coin is \(self.getCoinName())")
    }
    
    func getCoinName()-> String {
        return self.coinData.name
    }
    
    func getColorIndicator()-> Bool {
        let chartPriceChange = (coinData.sparklineIn7D?.price.last ?? 0) - (coinData.sparklineIn7D?.price.first ?? 0)
        return chartPriceChange > 0 ? true : false
    }
    
    func configureChartData() {
        guard let priceData = coinData.sparklineIn7D?.price else { return }
        var index = 0
        self.minPrice = priceData.min() ?? 0.0
        self.maxPrice = priceData.max() ?? 0.0
        self.yAxisValue = [minPrice, ((minPrice+maxPrice)/2) , maxPrice]
        self.endDate = Date(dateString: coinData.lastUpdated ?? "")
        for price in priceData.reversed() {
            let date = endDate.addingTimeInterval(-1 * 60 * 60 * Double(index))
            let chartDataItem = ChartData(date: date, value: price)
            self.chartData.append(chartDataItem)
            index += 1
        }
        self.startDate = endDate.addingTimeInterval(-1 * 60 * 60 * Double(index))
        self.xAxisValue = [startDate, endDate]
    }
}
