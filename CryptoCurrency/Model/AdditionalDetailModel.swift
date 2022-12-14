//
//  AdditionalDetailModel.swift
//  CryptoCurrency
//
//  Created by Macbook Air M1 on 2022/12/14.
//

import Foundation

struct AdditionalDetailModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let status: [CryptoItemView]
}
