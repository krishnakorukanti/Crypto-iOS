//
//  Double.swift
//  Crypto
//
//  Created by sai krishna korukanti on 30/03/22.
//

import Foundation

extension Double{
    
    
    private var currencyFormatter6 : NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "inr"
        formatter.currencySymbol = "₹"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func asCurrencyWith6Decimals() -> String{
        
        let number = NSNumber(value: self)
        
        return currencyFormatter6.string(from: number) ?? "₹0.00"
    }
    
    func asNumberString() -> String{
        return String(format: "%.2f", self)
    }
    
    func asPercentageString() -> String{
        return asNumberString() + "%"
    }
}
