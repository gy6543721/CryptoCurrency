//
//  CryptoCurrencyTests.swift
//  CryptoCurrencyTests
//
//  Created by Macbook Pro on 2025/3/9.
//

import XCTest
@testable import CryptoCurrency

final class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!

    override func setUpWithError() throws {
        viewModel = HomeViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    // Test if the checkTopCrypto() method correctly filters the top cryptocurrencies
    func testCheckTopCrypto() throws {
        // Given
        let coin1 = Coin.mock(priceChangePercentage24H: 5.0) // Positive change
        let coin2 = Coin.mock(id: "ethereum", symbol: "eth", name: "Ethereum", priceChangePercentage24H: 3.0) // Positive change
        let coin3 = Coin.mock(id: "litecoin", symbol: "ltc", name: "Litecoin", priceChangePercentage24H: -2.0) // Negative change

        viewModel.coins = [coin1, coin2, coin3]

        // When
        viewModel.checkTopCrypto()

        // Then
        XCTAssertEqual(viewModel.topCrypto.count, 3, "Top crypto should contain 3 coins with positive price change")
        XCTAssertEqual(viewModel.topCrypto.first?.id, "bitcoin", "Bitcoin should be the top crypto")
    }
}

extension Coin {
    static func mock(
        id: String = "bitcoin",
        symbol: String = "btc",
        name: String = "Bitcoin",
        image: String = "https://example.com/bitcoin.png",
        currentPrice: Double = 50000,
        marketCap: Double = 1000000000,
        marketCapRank: Double = 1,
        priceChangePercentage24H: Double = 5.0
    ) -> Coin {
        return Coin(
            id: id,
            symbol: symbol,
            name: name,
            image: image,
            currentPrice: currentPrice,
            marketCap: marketCap,
            marketCapRank: marketCapRank,
            fullyDilutedValuation: nil,
            totalVolume: nil,
            high24H: nil,
            low24H: nil,
            priceChange24H: 1000,
            priceChangePercentage24H: priceChangePercentage24H,
            marketCapChange24H: nil,
            marketCapChangePercentage24H: nil,
            circulatingSupply: nil,
            totalSupply: nil,
            maxSupply: nil,
            ath: nil,
            athChangePercentage: nil,
            athDate: nil,
            atl: nil,
            atlChangePercentage: nil,
            atlDate: nil,
            lastUpdated: nil,
            sparklineIn7D: nil
        )
    }
}
