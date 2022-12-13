//
//  HomeViewModel.swift
//  CryptoCurrency
//
//  Created by Macbook Air M1 on 2022/12/13.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var topCrypto = [Coin]()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let cryptoURLString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=200&page=1&sparkline=true"
        
        guard let cryptoURL = URL(string: cryptoURLString) else { return }
        URLSession.shared.dataTask(with: cryptoURL) { [self] data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response: \(response.statusCode)")
            }
            
            guard let data = data else { return }
            let dataString = String(data: data, encoding: .utf8)
            print("Data: \(dataString ?? "No Data")")
            
            do {
                let coinData = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coinData
                    self.checkTopCrypto()
                }
            } catch let error {
                print("Error: \(error)")
                return
            }
        }.resume()
    }
    
    func checkTopCrypto() {
        let topCrypto = coins.sorted (by: {
            $0.priceChangePercentage24H > $1.priceChangePercentage24H
        })
        self.topCrypto = Array(topCrypto.prefix(20))
    }
}
