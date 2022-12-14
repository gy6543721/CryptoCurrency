//
//  Date.swift
//  CryptoCurrency
//
//  Created by Macbook Air M1 on 2022/12/14.
//

import Foundation

extension Date {
    init (dateString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss:SSSZ"
        let date = formatter.date(from: dateString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        return formatter
    }
    
    func toShortDate() -> String {
        return shortDateFormatter.string(from: self)
    }
}
