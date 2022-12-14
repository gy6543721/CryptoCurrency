//
//  Double.swift
//  CryptoCurrency
//
//  Created by Macbook Air M1 on 2022/12/14.
//

import Foundation

extension Double {
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var largeNumberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        return formatter
    }
    
    private var percentageFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "$0.00"
    }
    
    func toLargeNumber() -> String {
        return largeNumberFormatter.string(for: self) ?? "$0"
    }
    
    func toPercentage() -> String {
        return (percentageFormatter.string(for: self) ?? "0.00") + "%"
    }
    
    func toShortNumber() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-": ""
        
        switch num {
            case 1_000_000_000_000_000_000...:
                let formatted = num / 1_000_000_000_000_000_000
                let resultFormatted = formatted.toLargeNumber()
                return "\(sign)\(resultFormatted)Qi"
        
            case 1_000_000_000_000_000...:
                let formatted = num / 1_000_000_000_000_000
                let resultFormatted = formatted.toCurrency()
                return "\(sign)\(resultFormatted)Qa"
            
            case 1_000_000_000_000...:
                let formatted = num / 1_000_000_000_000
                let resultFormatted = formatted.toCurrency()
                return "\(sign)\(resultFormatted)T"
            
            case 1_000_000_000...:
                let formatted = num / 1_000_000_000
                let resultFormatted = formatted.toCurrency()
                return "\(sign)\(resultFormatted)B"
            
            case 1_000_000...:
                let formatted = num / 1_000_000
                let resultFormatted = formatted.toCurrency()
                return "\(sign)\(resultFormatted)M"
            
            case 1_000...:
                let formatted = num / 1_000
                let resultFormatted = formatted.toCurrency()
                return "\(sign)\(resultFormatted)K"
            
            case 0...:
                return self.toCurrency()
            
            default:
                return "\(sign)\(self)"
        }
    }
}
